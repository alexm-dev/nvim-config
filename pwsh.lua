-- pwsh-term.lua
-- Open pwsh (PowerShell) in current window / split / vsplit / floating terminal.
-- - Uses fn.termopen(...) with an on_exit callback (preferred) to reliably close terminal windows
--   and delete the terminal buffer when the shell exits.
-- - Falls back to :terminal when termopen isn't available; for fallback we attach a TermClose
--   autocmd to perform cleanup.
-- - Starts terminals in dedicated scratch buffers for splits/current-window flows to avoid
--   leaving stray dashboard/special buffers behind.
-- - Provides buffer-local mappings:
--     <Esc> (terminal-mode) -> Normal-mode
--     <CR> (normal-mode, in terminal buffer) -> close/delete terminal buffer & window
--     q   (normal-mode, in terminal buffer) -> same as <CR>
--
-- Usage:
--   :PwshTerm       -> open pwsh in the current window (does not auto-close the window)
--   :Pwsh           -> open pwsh in a horizontal split (auto-closes split on exit)
--   :PwshVsplit     -> open pwsh in a vertical split (auto-closes split on exit)
--   :PwshFloat      -> open pwsh in a floating terminal (auto-closes float on exit)

local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local notify = vim.notify

-- Find pwsh or powershell on PATH
local function find_pwsh()
    if fn.executable("pwsh") == 1 then return "pwsh" end
    if fn.executable("powershell") == 1 then return "powershell" end
    return nil
end

-- Build command table for termopen (avoid shell parsing)
local function build_cmd_tbl(args)
    local pw = find_pwsh()
    if not pw then
        notify("[pwsh-term] could not find 'pwsh' or 'powershell' on PATH", vim.log.levels.ERROR)
        return nil
    end
    if not args or #args == 0 then return { pw } end
    local t = { pw }
    for _, a in ipairs(args) do table.insert(t, a) end
    return t
end

-- Close all windows displaying bufnr and delete the buffer
local function close_all_windows_and_delete_buf(bufnr)
    for _, w in ipairs(api.nvim_list_wins()) do
        if api.nvim_win_is_valid(w) then
            local ok, b = pcall(api.nvim_win_get_buf, w)
            if ok and b == bufnr then
                pcall(api.nvim_win_close, w, true)
            end
        end
    end
    if api.nvim_buf_is_valid(bufnr) then
        pcall(api.nvim_buf_delete, bufnr, { force = true })
    end
end

-- Attach helpful buffer-local mappings:
--  - <Esc> in terminal mode -> Normal
--  - <CR> in normal -> close/delete terminal buffer & windows
--  - q in normal -> same as <CR>
local function attach_mappings(term_buf, prev_win, allow_close)
    if not term_buf then return end

    pcall(function()
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = term_buf, noremap = true, silent = true })
    end)

    local close_fn = function()
        if api.nvim_buf_is_valid(term_buf) then
            close_all_windows_and_delete_buf(term_buf)
        else
            pcall(api.nvim_win_close, api.nvim_get_current_win(), true)
        end
        if prev_win and api.nvim_win_is_valid(prev_win) then pcall(api.nvim_set_current_win, prev_win) end
    end

    -- <CR> should close when allowed (splits/floats)
    if allow_close then
        pcall(function()
            vim.keymap.set("n", "<CR>", close_fn, { buffer = term_buf, noremap = true, silent = true })
        end)
    end

    -- q always available in terminal buffer to dismiss
    pcall(function()
        vim.keymap.set("n", "q", close_fn, { buffer = term_buf, noremap = true, silent = true })
    end)
end

-- Attach TermClose autocmd for fallback (:terminal) flow
local function attach_termclose_autocmd(term_buf, prev_win, allow_close)
    if not term_buf then return end
    api.nvim_create_autocmd("TermClose", {
        buffer = term_buf,
        once = true,
        callback = function()
            vim.schedule(function()
                if allow_close then
                    close_all_windows_and_delete_buf(term_buf)
                else
                    local wins = fn.win_findbuf(term_buf)
                    if type(wins) == "table" and #wins == 0 then
                        if api.nvim_buf_is_valid(term_buf) then pcall(api.nvim_buf_delete, term_buf, { force = true }) end
                    end
                end
                if prev_win and api.nvim_win_is_valid(prev_win) then pcall(api.nvim_set_current_win, prev_win) end
            end)
        end,
    })
end

-- Start terminal job in the current buffer using termopen (preferred) or fallback to :terminal.
-- cmd_tbl may be a table or string. prev_win is the window to restore. allow_close controls whether
-- the window showing the terminal will be closed on exit.
local function start_terminal_in_current_buf(cmd_tbl, prev_win, allow_close)
    local bufnr = api.nvim_get_current_buf()

    -- mark ephemeral
    pcall(function()
        vim.bo[bufnr].bufhidden = "wipe"
        vim.bo[bufnr].filetype = "pwsh-term"
        vim.bo[bufnr].buflisted = false
    end)

    -- on_exit cleanup for termopen
    local job_opts = {
        on_exit = function(_, exit_code, _)
            vim.schedule(function()
                -- ensure windows/buffer are removed on exit
                if allow_close then
                    close_all_windows_and_delete_buf(bufnr)
                else
                    local wins = fn.win_findbuf(bufnr)
                    if type(wins) == "table" and #wins == 0 then
                        if api.nvim_buf_is_valid(bufnr) then pcall(api.nvim_buf_delete, bufnr, { force = true }) end
                    end
                end
                if prev_win and api.nvim_win_is_valid(prev_win) then pcall(api.nvim_set_current_win, prev_win) end
            end)
        end,
    }

    -- Try fn.termopen safely
    local ok, job_or_err = pcall(function() return fn.termopen(cmd_tbl, job_opts) end)
    if ok and job_or_err and job_or_err ~= 0 then
        -- started via termopen
        pcall(function() cmd("startinsert") end)
        local term_buf = api.nvim_get_current_buf()
        attach_mappings(term_buf, prev_win, allow_close)
        return term_buf, job_or_err
    end

    -- Fallback: :terminal (string form)
    notify("[pwsh-term] termopen unavailable/failed: " .. tostring(job_or_err) .. " — falling back to :terminal",
        vim.log.levels.WARN)
    local term_cmd_str
    if type(cmd_tbl) == "table" then
        term_cmd_str = table.concat(cmd_tbl, " ")
    else
        term_cmd_str = tostring(cmd_tbl)
    end

    local ok2 = pcall(function() cmd("terminal " .. term_cmd_str) end)
    if not ok2 then
        notify("[pwsh-term] fallback :terminal failed for: " .. term_cmd_str, vim.log.levels.ERROR)
        return nil, nil
    end

    pcall(function() cmd("startinsert") end)
    local term_buf = api.nvim_get_current_buf()
    -- fallback: attach TermClose autocmd and mappings
    attach_termclose_autocmd(term_buf, prev_win, allow_close)
    attach_mappings(term_buf, prev_win, allow_close)
    return term_buf, nil
end

-- Create a scratch buffer in the given window (or current) and start terminal there.
local function create_scratch_and_start(prev_win, allow_close, cmd_tbl)
    -- current window should already be the target window
    local cur_win = api.nvim_get_current_win()
    local buf = api.nvim_create_buf(false, true) -- listed=false, scratch
    if not buf then
        notify("[pwsh-term] failed to create scratch buffer", vim.log.levels.ERROR)
        return nil
    end

    pcall(function()
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].filetype = "pwsh-term"
        vim.bo[buf].buflisted = false
    end)

    local ok = pcall(api.nvim_win_set_buf, cur_win, buf)
    if not ok then
        notify("[pwsh-term] failed to set scratch buffer into window", vim.log.levels.ERROR)
        pcall(api.nvim_buf_delete, buf, { force = true })
        return nil
    end

    -- start terminal in that buffer/window
    return start_terminal_in_current_buf(cmd_tbl, prev_win, allow_close)
end

-- Open in a split/vsplit: create the split, set scratch buffer, start terminal
local function open_term_in_split(cmd_tbl, kind)
    local prev_win = api.nvim_get_current_win()
    if kind == "vsplit" then
        pcall(function() cmd("vsplit") end)
    else
        pcall(function() cmd("split") end)
    end

    -- Now the new split is current; put a scratch buffer there and start terminal
    return create_scratch_and_start(prev_win, true, cmd_tbl)
end

-- Open in current window: replace with scratch buffer (so dashboard/special buffers won't be replaced)
local function open_term_in_current(cmd_tbl)
    local prev_win = api.nvim_get_current_win()
    return create_scratch_and_start(prev_win, false, cmd_tbl)
end

-- Floating terminal: create a scratch buffer and floating window, then start terminal there
local function open_float_term(cmd_tbl)
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.8)
    local row = math.ceil((vim.o.lines - height) / 2 - 1)
    local col = math.ceil((vim.o.columns - width) / 2)

    local buf = api.nvim_create_buf(false, true)
    if not buf then
        notify("[pwsh-term] failed to create buffer for floating terminal", vim.log.levels.ERROR)
        return nil
    end

    pcall(function()
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].filetype = "pwsh-term"
        vim.bo[buf].buflisted = false
    end)

    local win_opts = {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
    }

    local prev_win = api.nvim_get_current_win()
    local ok, win = pcall(api.nvim_open_win, buf, true, win_opts)
    if not ok or not win then
        notify("[pwsh-term] failed to open floating window", vim.log.levels.ERROR)
        if api.nvim_buf_is_valid(buf) then pcall(api.nvim_buf_delete, buf, { force = true }) end
        return nil
    end

    -- make the float current and start terminal in its buffer
    pcall(api.nvim_set_current_win, win)
    local term_buf, job = start_terminal_in_current_buf(cmd_tbl, prev_win, true)
    if not term_buf then
        if api.nvim_win_is_valid(win) then pcall(api.nvim_win_close, win, true) end
        if api.nvim_win_is_valid(prev_win) then pcall(api.nvim_set_current_win, prev_win) end
        return nil
    end

    -- extra mapping: Enter to close (already provided by attach_mappings but ensure for float too)
    pcall(function()
        vim.keymap.set("n", "<CR>", function()
            close_all_windows_and_delete_buf(term_buf)
            if prev_win and api.nvim_win_is_valid(prev_win) then pcall(api.nvim_set_current_win, prev_win) end
        end, { buffer = term_buf, noremap = true, silent = true })
    end)

    return term_buf, job
end

-- User commands
api.nvim_create_user_command("PwshTerm", function(opts)
    local cmd_tbl = build_cmd_tbl(opts.fargs)
    if not cmd_tbl then return end
    open_term_in_current(cmd_tbl)
end, { nargs = "*", desc = "Open pwsh in the current window (does not auto-close window)" })

api.nvim_create_user_command("Pwsh", function(opts)
    local cmd_tbl = build_cmd_tbl(opts.fargs)
    if not cmd_tbl then return end
    open_term_in_split(cmd_tbl, "split")
end, { nargs = "*", desc = "Open pwsh in a horizontal split (auto-closes on exit)" })

api.nvim_create_user_command("PwshVsplit", function(opts)
    local cmd_tbl = build_cmd_tbl(opts.fargs)
    if not cmd_tbl then return end
    open_term_in_split(cmd_tbl, "vsplit")
end, { nargs = "*", desc = "Open pwsh in a vertical split (auto-closes on exit)" })

api.nvim_create_user_command("PwshFloat", function(opts)
    local cmd_tbl = build_cmd_tbl(opts.fargs)
    if not cmd_tbl then return end
    open_float_term(cmd_tbl)
end, { nargs = "*", desc = "Open pwsh in a floating terminal (auto-closes on exit)" })

-- Default keymaps (feel free to override in your config)
local map_opts = { noremap = true, silent = true }
pcall(function() vim.keymap.set("n", "<leader>tp", ":PwshFloat<CR>",
        vim.tbl_extend("force", map_opts, { desc = "Open pwsh (float)" })) end)
pcall(function() vim.keymap.set("n", "<leader>ts", ":Pwsh<CR>",
        vim.tbl_extend("force", map_opts, { desc = "Open pwsh (split)" })) end)
pcall(function() vim.keymap.set("n", "<leader>tv", ":PwshVsplit<CR>",
        vim.tbl_extend("force", map_opts, { desc = "Open pwsh (vsplit)" })) end)
