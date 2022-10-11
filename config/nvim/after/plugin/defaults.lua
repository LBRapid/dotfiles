local api = vim.api
local g = vim.g
local opt = vim.opt


-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- Enable colors in terminal
opt.swapfile = false
opt.backup = false
opt.hidden = true
opt.writebackup = false
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = false --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.timeoutlen = 500 --Time in milliseconds to wait for a mapped sequence to complete.
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard

-- File search
opt.path:remove "/usr/include"
opt.path:append "**"
opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

-- Better netrw
g.netrw_banner = 0
g.netrw_fastbrowse = 0

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Colorscheme
g.material_style = "darker"
vim.cmd "colorscheme material"
