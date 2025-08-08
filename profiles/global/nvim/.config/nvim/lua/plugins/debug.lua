---@param config {type?:string, args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {} --[[@as string[] | string ]]
	local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
		if config.type and config.type == "java" then
			---@diagnostic disable-next-line: return-type-mismatch
			return new_args
		end
		return require("dap.utils").splitstr(new_args)
	end
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
		init = function()
			for name, icon in pairs(utils.icons.debugger) do
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))  end, desc = "Breakpoint Condition" },
			{ "<leader>db", function() require("dap").toggle_breakpoint()             end, desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue()                      end, desc = "Continue" },
			{ "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
			{ "<leader>dC", function() require("dap").run_to_cursor()                 end, desc = "Run to Cursor" },
			{ "<leader>dg", function() require("dap").goto_()                         end, desc = "Go to Line (No Execute)" },
			{ "<leader>di", function() require("dap").step_into()                     end, desc = "Step Into" },
			{ "<leader>dj", function() require("dap").down()                          end, desc = "Down" },
			{ "<leader>dk", function() require("dap").up()                            end, desc = "Up" },
			{ "<leader>dl", function() require("dap").run_last()                      end, desc = "Run Last" },
			{ "<leader>do", function() require("dap").step_out()                      end, desc = "Step Out" },
			{ "<leader>dO", function() require("dap").step_over()                     end, desc = "Step Over" },
			{ "<leader>dp", function() require("dap").pause()                         end, desc = "Pause" },
			{ "<leader>dr", function() require("dap").repl.toggle()                   end, desc = "Toggle REPL" },
			{ "<leader>ds", function() require("dap").session()                       end, desc = "Session" },
			{ "<leader>dt", function() require("dap").terminate()                     end, desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover()              end, desc = "Widgets" },
		},
		config = function()
			local dap = require("dap")

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c

			dap.adapters.coreclr = {
				type = "executable",
				command = "path/to/netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
			}

			--  setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
}
