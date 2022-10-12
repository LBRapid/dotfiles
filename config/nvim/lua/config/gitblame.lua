local M = {}

function M.setup()
  local g = vim.g
  g.gitblame_display_virtual_text = 0
  g.gitblame_message_template = "<author> • <date>"
end

return M
