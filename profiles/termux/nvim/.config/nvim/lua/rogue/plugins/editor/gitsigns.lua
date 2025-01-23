return {
	"lewis6991/gitsigns.nvim",
	enabled = "false",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
  -- stylua: ignore
  keys = {
    { "<leader>g", "", desc = "git" },
    { "<leader>gb", function() package.loaded.gitsigns.blame_line({ full = true })  end, desc = "Blame line"                          },
    { "<leader>gB", function() package.loaded.gitsigns.toggle_current_line_blame()  end, desc = "Toggle line blame"                   },
    { "<leader>gp", function() package.loaded.gitsigns.preview_hunk()               end, desc = "Preview hunk"                        },
    { "<leader>gd", function() package.loaded.gitsigns.diffthis()                   end, desc = "Diff this"                           },
    { "<leader>gD", function() package.loaded.gitsigns.diffthis("~")                end, desc = "Diff this ~"                         },
    { "<leader>gs", function() package.loaded.gitsigns.stage_hunk()                 end, desc = "Stage hunk"                          },
    { "<leader>gS", function() package.loaded.gitsigns.stage_buffer()               end, desc = "Stage buffer"                        },
    { "<leader>gu", function() package.loaded.gitsigns.undo_stage_hunk()            end, desc = "Unstage hunk"                        },
    { "<leader>gr", function() package.loaded.gitsigns.reset_hunk()                 end, desc = "Reset hunk"                          },
    { "<leader>gR", function() package.loaded.gitsigns.reset_buffer()               end, desc = "Reset buffer"                        },
    { "<leader>gt", function() package.loaded.gitsigns.toggle_deleted()             end, desc = "Toggle Deleted"                      },
  },
	opts = {},
}
