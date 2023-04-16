local dap = require("dap")
local dapui = require("dapui")
local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/site/pack/packer/opt/vscode-js-debug"
local dap_vscode_js = require("dap-vscode-js")

dapui.setup()

-- setup javascript and typescript debugger
dap_vscode_js.setup {
    -- node_path = "node",
    debugger_path = DEBUGGER_PATH,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { "typescript", "javascript" } do
    require("dap").configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }
end

-- Style the breakpoints
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })

-- Debugger keymaps
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set("n", "<F5>", require("dap").continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", require("dap").step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", require("dap").step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<F8>", require("dap").step_out, { noremap = true, silent = true })

-- Open dapui window when a new debug session is created
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- Close dapui window when a debug session is terminated
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
