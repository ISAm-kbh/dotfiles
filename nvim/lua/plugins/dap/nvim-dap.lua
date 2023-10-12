local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = os.getenv("HOME") .. '/apps/cpptools/debugAdapters/bin/OpenDebugAD7' 
}

local cppdbg = {
    name  = "Launch cppdbg",
    type = "cppdbg",
    request = "launch",
    program = function()
        return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
        )
    end,
    args = function()
        local inString = vim.fn.input(
        "Args: ", '',
        "file"
        )
        return { inString }
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = false,
    --miDebuggerArgs = "--args", 
}


require('dap').configurations.cpp = {
    cppdbg
}
