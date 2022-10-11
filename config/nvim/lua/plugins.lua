local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
		profile = {
			enable = true,
			threshold = 0,
		},

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Load only when required
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Colorscheme
    use { 
			"marko-cerovac/material.nvim",
			config = function()
				require('material').setup()
			end,
		}

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

		-- WhichKey
		use {
			 "folke/which-key.nvim",
			 event = "VimEnter",
			 config = function()
				 require("config.whichkey").setup()
			 end,
		}

		use {
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig"
		}

		-- IndentLine
		use {
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("config.indentblankline").setup()
			end,
		}

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }
		
    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

		-- Statusline
		use {
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = function()
				require("config.lualine").setup()
			end,
			requires = { "nvim-web-devicons" },
		}

		-- Fuzzy file search
		use { 'junegunn/fzf', run = './install --bin', }
		use { 'ibhagwan/fzf-lua',
			-- optional for icon support
			requires = { 'kyazdani42/nvim-web-devicons' }
		}

		-- Buffer line
		use {
			"akinsho/nvim-bufferline.lua",
			event = "BufReadPre",
			wants = "nvim-web-devicons",
			config = function()
				require("config.bufferline").setup()
			end,
		}

		-- Nvim Tree File Explorer
		use {
		 "kyazdani42/nvim-tree.lua",
		 requires = {
			 "kyazdani42/nvim-web-devicons",
		 },
		 cmd = { "NvimTreeToggle", "NvimTreeClose" },
			 config = function()
				 require("config.nvimtree").setup()
			 end,
		}

		-- Telescope
		if PLUGINS.telescope.enabled then
			use {
				"nvim-telescope/telescope.nvim",
				opt = true,
				config = function()
					require("config.telescope").setup()
				end,
				cmd = { "Telescope" },
				module = "telescope",
				keys = { "<leader>f", "<leader>p" },
				wants = {
					"plenary.nvim",
					"popup.nvim",
					"telescope-fzf-native.nvim",
					"telescope-project.nvim",
					"telescope-repo.nvim",
					"telescope-file-browser.nvim",
					"project.nvim",
				},
				requires = {
					"nvim-lua/popup.nvim",
					"nvim-lua/plenary.nvim",
					{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
					"nvim-telescope/telescope-project.nvim",
					"cljoly/telescope-repo.nvim",
					"nvim-telescope/telescope-file-browser.nvim",
					{
						"ahmedkhalf/project.nvim",
						config = function()
							require("project_nvim").setup {}
						end,
					},
				},
			}
		end

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
			},
		}

    -- Notification
    use {
      "rcarriga/nvim-notify",
      event = "BufReadPre",
      config = function()
        require("config.notify").setup()
      end,
      disable = false,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
