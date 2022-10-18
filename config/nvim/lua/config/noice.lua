local M = {}

function M.setup()
  local noice = require "noice"
  noice.setup {
    messages = {
      enabled = false,
    },
  }
end

return M
