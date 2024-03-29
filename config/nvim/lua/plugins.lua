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
    use { "lewis6991/impatient.nvim" }

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

    -- Better Netrw
    use { "tpope/vim-vinegar" }

    -- Git
    use {
      "TimUntersberger/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    -- Codi
    use {
      "metakirby5/codi.vim",
      event = "VimEnter",
    }

    -- Git blame
    use {
      "f-person/git-blame.nvim",
      config = function()
        require("config.gitblame").setup()
      end
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
      module = "hop",
      keys = { "f", "F", "t", "T", "s", "S" },
      config = function()
        require("config.hop").setup()
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
      after = "nvim-treesitter",
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

    -- Surround
    use({
      "kylechui/nvim-surround",
      event = "VimEnter",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup()
      end
    })

    -- Completion
    use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "VimEnter",
      run = ":COQdeps",
      config = function()
        require("config.coq").setup()
      end,
      requires = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
      },
      disable = false,
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
          "telescope-fzy-native.nvim",
					"project.nvim",
				},
				requires = {
					"nvim-lua/popup.nvim",
					"nvim-lua/plenary.nvim",
					{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
          "nvim-telescope/telescope-fzy-native.nvim",
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

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
       event = "BufRead",
       run = ":TSUpdate",
       config = function()
         require("config.treesitter").setup()
       end,
    }

    -- End wise
    use {
      "RRethy/nvim-treesitter-endwise",
      wants = "nvim-treesitter",
      event = "BufRead",
      disable = false,
    }

    use {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "BufRead",
      disable = false,
    }

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			wants = { "mason.nvim", "mason-lspconfig.nvim", "lsp_signature.nvim", "coq_nvim", "null-ls.nvim", "fidget.nvim" },
      event = "VimEnter",
      after = {
        "mason.nvim",
        "mason-lspconfig.nvim",
      },
			config = function()
        require("config.mason").setup()
				require("config.lsp").setup()
			end,
			requires = {
        "williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
        "ms-jpq/coq_nvim",
        "ray-x/lsp_signature.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "j-hui/fidget.nvim",
			},
		}

-- Lua
    use {
      "folke/trouble.nvim",
      event = "BufReadPre",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end
    }

    -- Notification
    use {
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        require("config.notify").setup()
      end,
      disable = false,
    }

    -- Noice
    use({
      "folke/noice.nvim",
      event = "VimEnter",
      module = "notify",
      config = function()
        require("config.noice").setup()
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      disable = true,
    })

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end

    -- Auto change root directory
    use { "airblade/vim-rooter" }
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
