local status, lazy = pcall(require, "lazy")
if not status then
  print("lazy is not installed")
  return
end

local plugins = {
  -- gruber
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruber-darker")
      vim.api.nvim_command("highlight Cursor guibg=red")
      -- vim.api.nvim_command("hi! LineNr guibg=#2e2d2d ctermbg=none")
    end,
    enabled = true,
  },

  -- colorscheme: gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.gruvbox")
    end,
    enabled = false,
  },

  -- colorscheme: catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.catppuccin")
    end,
    enabled = false,
  },

  -- colorscheme: tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.tokyonight")
      vim.api.nvim_command("colorscheme tokyonight")
    end,
    enabled = false,
  },

  -- colorscheme: github
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.github-theme")
    end,
    enabled = false,
  },

  -- colorscheme: kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.kanagawa")
    end,
    enabled = false,
  },

  -- colorscheme: nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.nightfox")
    end,
    enabled = false,
  },

  {
    "stevearc/oil.nvim",
    config = function()
      require("plugin-config.nvim-oil")
    end,
  },

  -- nvim-telescope
  -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    config = function()
      require("plugin-config.nvim-telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- nvim-telescope extensions
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
  },

  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    enabled = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin-config.nvim-gitsigns")
    end,
  },

  -- git-fugitive
  "tpope/vim-fugitive",

  -- git-diffview
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugin-config.nvim-lualine")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", opt = lazy },
  },

  -- lualine-lsp-progress
  {
    "arkav/lualine-lsp-progress",
    dependencies = "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  "easymotion/vim-easymotion",

  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugin-config.nvim-comment")
    end,
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugin-config.nvim-todo-comments")
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugin-config.nvim-autopairs")
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugin-config.nvim-illuminate")
    end,
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("plugin-config.nvim-surround")
    end,
  },

  -- exchange text object ( NOTE: `cxc` to cancel)
  "gbprod/substitute.nvim",

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugin-config.nvim-colorizer")
    end,
  },

  "dstein64/nvim-scrollview",

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  "dhruvasagar/vim-table-mode",

  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugin-config.nvim-treesitter")
    end,
  },

  "nvim-treesitter/playground",

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("plugin-config.nvim-treesitter-context")
    end,
  },

  "mg979/vim-visual-multi",

  "junegunn/vim-easy-align",

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugin-config.nvim-dashboard")
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    enabled = false,
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugin-config.nvim-zen-mode")
    end,
    enabled = false,
  },

  -- true-zen (like zen-mode and goyo-vim)
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("plugin-config.nvim-true-zen")
    end,
    enabled = false,
  },

  -- twilight (like limelight)
  {
    "folke/twilight.nvim",
    config = function()
      require("plugin-config.nvim-twilight")
    end,
    enabled = false,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugin-config.nvim-notify")
    end,
  },

  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("plugin-config.nvim-smooth-cursor")
    end,
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require("plugin-config.nvim-marks")
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugin-config.nvim-toggleterm")
    end,
    enabled = false,
  },

  -- vscode-like pictograms
  { "onsails/lspkind-nvim", enabled = false },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- NOTE: Disable LSP
      -- "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("plugin-config.nvim-cmp")
    end,
    enabled = false,
  },

  -- Configurations for Nvim LSP
  { "neovim/nvim-lspconfig", enabled = false },

  -- LSP UIs
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugin-config.nvim-lspsaga")
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    enabled = false,
  },

  {
    "SmiteshP/nvim-navbuddy",
    config = function()
      require("plugin-config.nvim-navbuddy")
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    enabled = false,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugin-config.lsp.lsp-signature")
    end,
    enabled = false,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("plugin-config.nvim-trouble")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("plugin-config.nvim-lsp-inlay-hints")
    end,
    enabled = false,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("plugin-config.nvim-rust-tool")
    end,
    enabled = false,
  },

  "rust-lang/rust.vim",

  "nvim-lua/plenary.nvim",

  -- adapter for debuger
  {
    "mfussenegger/nvim-dap",
  },

  -- ui for dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    event = "VeryLazy",
    config = function()
      require("plugin-config.nvim-dap-ui")
    end,
  },

  -- Mason lsp server installer and manager
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason.lspconfig.nvim",
    config = function()
      require("plugin-config.nvim-mason")
    end,
    enabled = true,
  },

  -- Debuger manager
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("plugin-config.mason-nvim-dap")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    config = function()
      require("plugin-config.nvim-luasnip")
    end,
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    enable = false,
  },

  -- File icons
  "nvim-tree/nvim-web-devicons",

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("plugin-config.nvim-transparent")
    end,
  },

  "tommcdo/vim-exchange",

  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("plugin-config.nvim-colorful-winsep")
    end,
  },

  -- neodev for lua in neovim
  { "folke/neodev.nvim", enabled = false },

  -- lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("plugin-config.nvim-lint")
    end,
  },

  -- formatter
  {
    "mhartington/formatter.nvim",
    config = function()
      require("plugin-config.nvim-formatter")
    end,
  },

  -- fzf in lua
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("plugin-config.nvim-fzf-lua")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = false,
  },

  -- vim sugar
  "tpope/vim-eunuch",
  "tpope/vim-unimpaired",

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      require("plugin-config.nvim-copilot")
    end,
  },

  -- Gen docs
  { "vim-scripts/DoxygenToolkit.vim", enable = false },

  -- Open big files
  {
    "LunarVim/bigfile.nvim",
  },

  -- complitaion-mode
  {
    "ej-shafran/compile-mode.nvim",
    -- version = "^5.0.0",
    -- you can just use the latest version:
    branch = "latest",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- if you want to enable coloring of ANSI escape codes in
      -- compilation output, add:
      { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        -- to add ANSI escape code support, add:
        -- baleia_setup = true,

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
      }
    end,
  },
}

return plugins
