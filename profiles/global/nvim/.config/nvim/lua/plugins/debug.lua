---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end

return {
	{
		"mfussenegger/nvim-dap",
		enabled = false,
		dependencies = {
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{ "igorlfs/nvim-dap-view", opts = {} },
		},
		init = function()
			local icons = require("myutils.icons")
			-- signs
			-- configure debugger diagnostics signs
			for name, icon in pairs(icons.debugger) do
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

			-- NOTE: dap for C/C++
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
					-- detached = false, -- On windows you may have to uncomment this.
				},
			}

			local cc_dap_config = {
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			}
			dap.configurations.c = { cc_dap_config }
			dap.configurations.cpp = { cc_dap_config }

			-- NOTE: dap for C#
			local netcoredbg = "path/to" .. "/netcoredbg"
			dap.adapters.coreclr = {
				type = "executable",
				command = netcoredbg,
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

			-- WARN: setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
			end
		end,
	},
}
