-- Windows: always use Scoop Node LTS inside Neovim (session-only).
if vim.fn.has("win32") == 1 then
    local uv = vim.uv or vim.loop
    local home = uv.os_homedir()

    local function norm(p)
        return (p or "")
            :gsub('^"(.-)"$', '%1') -- strip surrounding quotes
            :gsub("/", "\\")    -- normalize slashes
            :gsub("([^:])\\+$", "%1") -- strip trailing backslashes
            :lower()
    end

    local scoop = vim.env.SCOOP or (home .. "\\scoop")
    local node_dir = scoop .. "\\apps\\nodejs-lts\\current"

    -- Require node.exe so we don't prepend an empty dir
    if uv.fs_stat(node_dir .. "\\node.exe") then
        local path = vim.env.PATH or ""
        local first = path:match("^%s*([^;]+)") or ""
        if norm(first) ~= norm(node_dir) then
            local kept, target = {}, norm(node_dir)
            for entry in path:gmatch("([^;]+)") do
                if norm(entry) ~= target then table.insert(kept, entry) end
            end
            vim.env.PATH = node_dir .. (#kept > 0 and (";" .. table.concat(kept, ";")) or "")
        end
    end
end
