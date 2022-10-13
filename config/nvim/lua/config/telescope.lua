local M = {}

function M.setup()
  local actions = require "telescope.actions"
  local telescope = require "telescope"

  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
        },
      },
    },
    extensions = {
      project = {
        base_dirs = {
          '~/workspace',
        },
        sync_with_nvim_tree = false,
      },
    },
  }

  telescope.load_extension "fzf"
  telescope.load_extension "fzy_native"
  telescope.load_extension "project" -- telescope-project.nvim
  telescope.load_extension "repo"
  telescope.load_extension "file_browser"
  telescope.load_extension "projects" -- project.nvim
end

return M
