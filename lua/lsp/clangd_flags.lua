-- Helper module:
-- Standard clangd flags

local M = {}
M.flags = {
    "-xc++",
    "-std=c++17",

    "-fms-extensions",
    "-fms-compatibility",

    "--target=x86_64-pc-windows-msvc",

    "-D_WIN32",
    "-DWIN32",
    "-DWIN32_LEAN_AND_MEAN",
    "-D_CRT_SECURE_NO_WARNINGS",
    "-D_SCL_SECURE_NO_WARNINGS",
}

return M
