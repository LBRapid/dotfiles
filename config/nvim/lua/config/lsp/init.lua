local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  solargraph = {
    settings = {
      solargraph = {
        diagnostics = true,
        formatting = true,
      },
    },
  },
  tsserver = {},
  vimls = {},
  volar = {},
}

function M.on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- nvim-navic
  if client.server_capabilities.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)
end

local opts = {
  on_attach = M.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  local lspconfig = require "lspconfig"

  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
  }

  require("config.lsp.null-ls").setup(opts)

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local options = vim.tbl_deep_extend("force", opts, servers[server_name] or {})
      lspconfig[server_name].setup(options)
    end,
  }

  require("fidget").setup {}
end

return M
