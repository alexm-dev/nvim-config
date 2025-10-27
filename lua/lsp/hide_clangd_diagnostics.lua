-- Enhanced diagnostic filter for clangd: hides "redefinition_different_typedef" and "too many errors emitted, stopping now" diagnostics/messages.
-- Place in your config (~/.config/nvim/lua/) and require from init.lua.

local has_new = vim.diagnostic and vim.diagnostic.on_publish_diagnostics
local has_legacy = vim.lsp and vim.lsp.diagnostic and vim.lsp.diagnostic.on_publish_diagnostics

if not has_new and not has_legacy then
    vim.notify("hide_clangd_diagnostics: no diagnostics publisher found", vim.log.levels.WARN)
    return
end

local function is_clangd_source(d, ctx)
    if not d then return false end
    if d.source == "clangd" then return true end
    if ctx and ctx.client_id then
        local ok, client = pcall(vim.lsp.get_client_by_id, ctx.client_id)
        if ok and client and client.name == "clangd" then return true end
    end
    return false
end

local function is_typedef_redefinition(d, ctx)
    if not d then return false end
    if not is_clangd_source(d, ctx) then return false end
    local code = tostring(d.code or "")
    if code == "redefinition_different_typedef" then return true end
    if d.message then
        local m = d.message:lower()
        if m:match("typedef") and (m:match("redef") or m:match("redefinition")) then
            return true
        end
    end
    return false
end

local function is_too_many_errors(d, ctx)
    if not d then return false end
    if not is_clangd_source(d, ctx) then return false end
    local code = tostring(d.code or "")
    if code == "fatal_too_many_errors" then return true end
    if d.message then
        local m = d.message:lower()
        if m:match("too many errors") and m:match("stopping now") then
            return true
        end
    end
    return false
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
    if result and type(result.diagnostics) == "table" then
        local out = {}
        for _, d in ipairs(result.diagnostics) do
            if not (is_typedef_redefinition(d, ctx) or is_too_many_errors(d, ctx)) then
                table.insert(out, d)
            end
        end
        result.diagnostics = out
    end

    if has_new then
        return vim.diagnostic.on_publish_diagnostics(err, result, ctx, config)
    else
        return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
    end
end

-- Also hide "too many errors emitted, stopping now" from showMessage and logMessage
local function suppress_message(msg)
    msg = msg and msg:lower() or ""
    return msg:match("too many errors") and msg:match("stopping now")
end

local orig_show = vim.lsp.handlers["window/showMessage"]
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
    if suppress_message(params and params.message) then
        return
    end
    return orig_show(err, method, params, client_id)
end

local orig_log = vim.lsp.handlers["window/logMessage"]
vim.lsp.handlers["window/logMessage"] = function(err, method, params, client_id)
    if suppress_message(params and params.message) then
        return
    end
    return orig_log(err, method, params, client_id)
end
