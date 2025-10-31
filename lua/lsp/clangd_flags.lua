-- Helper module:
-- Standard clangd flags

local M = {}
M.flags = {
    "-std=c++17",
    "-D_WIN32",
    "-DWIN32",

    "--target=x86_64-w64-mingw32",
    "-D__MINGW32__",
    "-D__MINGW64__",
    "-D__USE_MINGW_ANSI_STDIO=1",
    "-D__STDC_WANT_LIB_EXT1__=1",
    "-IC:/msys64/mingw64/include/c++/15.2.0",
    "-IC:/msys64/mingw64/include/c++/15.2.0/x86_64-w64-mingw32",
    "-IC:/msys64/mingw64/include",
    "-IC:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/15.2.0/include",
}

return M
