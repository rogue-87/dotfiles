local M = {
	ascii = require("myutils.ascii"),
	cmd = require("myutils.cmd"),
	icons = require("myutils.icons"),
	lsp = require("myutils.lsp"),
}

---@param fn fun()
function M.on_very_lazy(fn)
	vim.api.nvim_create_autocmd("User", {
		group = vim.api.nvim_create_augroup("Lazy", { clear = true }),
		pattern = "VeryLazy",
		callback = function()
			fn()
		end,
	})
end

--modules like "autocmds" | "options" | "keymaps"
---@param modules string[]
function M.lazy_load(modules)
	-- when no file is opened at startup
	if vim.fn.argc(-1) == 0 then
		-- autocmds and keymaps can wait to load
		-- always load lazyvim, then user file
		M.on_very_lazy(function()
			for i, v in ipairs(modules) do
				require(modules[i])
			end
		end)
	else
		-- load them now so they affect the opened buffers
		for i, v in ipairs(modules) do
			require(modules[i])
		end
	end
end

---@param plugin string
---@return boolean
function M.has(plugin)
	if package.loaded["lazy"] then
		return require("lazy.core.config").plugins[plugin] ~= nil
	else
		local plugin_name = vim.split(plugin, ".", { plain = true, trimempty = true })
		return package.loaded[plugin_name[1]] ~= nil
	end
end

---@param description? string
---@param opt table
local function mdesc(opt, description)
	return vim.tbl_extend("force", opt, { desc = description })
end

--- wrapper function around `vim.keymap.set`
---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts? table
---@param desc? string
function M.map(mode, lhs, rhs, opts, desc)
	opts = opts and opts or {}
	opts = mdesc(opts, desc)
	vim.keymap.set(mode, lhs, rhs, opts)
end

--- shortcut to vim.api.nvim_create_autocmd
M.autocmd = vim.api.nvim_create_autocmd

--- shortcut to vim.api.nvim_create_augroup
M.augroup = vim.api.nvim_create_augroup

return M
