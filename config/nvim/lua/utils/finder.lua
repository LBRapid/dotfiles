local M = {}

function M.find_files()
  if PLUGINS.telescope.enabled then
    local opts = {}
    local telescope = require "telescope.builtin"

		if vim.fn.system "git rev-parse --is-inside-work-tree" == true then
			telescope.git_files(opts)
		else
      telescope.find_files(opts)
    end
	else
		local fzf = require "fzf-lua"
		if vim.fn.system "git rev-parse --is-inside-work-tree" == true then
			fzf.git_files()
		else
			fzf.files()
		end
	end
end

return M
