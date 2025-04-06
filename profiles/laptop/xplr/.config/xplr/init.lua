
---@diagnostic disable
version = "1.0.0"
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### General Configuration --------------------------------------------------
--
-- The general configuration properties are grouped together in
-- `xplr.config.general`.

-- Set it to `true` if you want to ignore the startup errors. You can still see
-- the errors in the logs.
--
-- Type: boolean
xplr.config.general.disable_debug_error_mode = false

-- Set it to `true` if you want to enable mouse scrolling.
--
-- Type: boolean
xplr.config.general.enable_mouse = true

xplr.config.general.show_hidden = true

xplr.config.general.read_only = false

xplr.config.general.enable_recover_mode = false

xplr.config.general.hide_remaps_in_help_menu = false

xplr.config.general.paginated_scrolling = false

-- ### Node Types -------------------------------------------------------------
--
-- This section defines how to deal with different kinds of nodes (files,
-- directories, symlinks etc.) based on their properties.
--
-- One node can fall into multiple categories. For example, a node can have the
-- *extension* `md`, and also be a *file*. In that case, the properties from
-- the more  specific category i.e. *extension* will be used.
--
-- This can be configured using the `xplr.config.node_types` Lua API.

-- The style for the directory nodes
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.directory.style = {}

-- Metadata for the directory nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.directory.meta.foo = "foo"
-- xplr.config.node_types.directory.meta.bar = "bar"
-- ```
xplr.config.node_types.directory.meta.icon = ""

-- The style for the file nodes.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.file.style = {}

-- Metadata for the file nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.file.meta.foo = "foo"
-- xplr.config.node_types.file.meta.bar = "bar"
-- ```
xplr.config.node_types.file.meta.icon = "󰈔"

-- The style for the symlink nodes.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.symlink.style = {}

-- Metadata for the symlink nodes.
-- You can set as many metadata as you want.
--
-- Type: nullable string
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.symlink.meta.foo = "foo"
-- xplr.config.node_types.symlink.meta.bar = "bar"
-- ```
xplr.config.node_types.symlink.meta.icon = " "

-- Metadata and style based on mime types.
-- It is possible to use the wildcard `*` to match all mime sub types. It will
-- be overwritten by the more specific sub types that are defined.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value:
--   * key: string
--   * value: [Node Type](https://xplr.dev/en/node-type)
--
-- Example:
--
xplr.config.node_types.mime_essence = {
	application = {
		-- application/*
		-- ["*"] = { meta = { icon = "a" } },

		-- application/pdf
		pdf = { meta = { icon = " " }, style = { fg = "Blue" } },

		-- application/zip
		zip = { meta = { icon = " " } },
	},
}

-- xplr.config.node_types.extension.md = { meta = { icon = " " }, style = { fg = "Blue" } }
-- xplr.config.node_types.extension.rs = { meta = { icon = " " } }

xplr.config.node_types.extension = {}

-- Metadata and style based on special file names.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Node Type](https://xplr.dev/en/node-type)
--
-- Example:
--
-- ```lua
-- xplr.config.node_types.special["Cargo.toml"] = { meta = { icon = "" } }
-- xplr.config.node_types.special["Downloads"] = { meta = { icon = "" }, style = { fg = "Blue" } }
-- ```
xplr.config.node_types.special = {}

