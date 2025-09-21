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

local function setup_codelldb(dap)
	dap.adapters.codelldb = {
		type = "executable",
		command = "codelldb",
		-- detached = false, -- On windows you may have to uncomment this:
	}

	dap.configurations.c = {
		{
			name = "Launch",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
		},
	}
	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
	dap.configurations.zig = dap.configurations.c
end

local function setup_netcoreclr(dap)
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
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
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

			setup_codelldb(dap)
			setup_netcoreclr(dap)
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		-- stylua: ignore
		keys = {
			{ "<leader>du", function() require("dap-view").toggle() end, desc = "Dap View Toggle" },
		},
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapview = require("dap-view")

			dapview.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapview.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapview.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapview.close()
			end
		end,
	},
}
