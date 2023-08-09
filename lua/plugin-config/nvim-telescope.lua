local status, telescope = pcall(require, "telescope")
if not status then
  print("telescope is not installed")
  return
end

telescope.load_extension("project")
telescope.load_extension("notify")
telescope.load_extension("live_grep_args")

local actions = require("telescope.actions")
local icons = require("plugin-config.icons")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      ".git/",
      "target/",
      -- "docs/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      ".dart_tool/",
      -- ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      -- "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
    },
    mappings = {
      i = {
        -- ["<C-n>"] = actions.cycle_history_next,
        -- ["<C-p>"] = actions.cycle_history_prev,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.complete_tag,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["q"] = actions.close,
        ["<C-c>"] = actions.close,
        ["<ESC>"] = actions.close,
        ["dd"] = require("telescope.actions").delete_buffer,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    live_grep = {
      previewe = true,
      theme = "ivy",
    },
    grep_string = {
      previewe = true,
      theme = "ivy",
    },
    find_files = {
      previewe = true,
      theme = "ivy",
    },
    git_files = {
      previewe = true,
      theme = "ivy",
    },
    buffers = {
      theme = "cursor",
      previewer = false,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    lsp_implementations = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_references = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_definitions = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_diagnostics = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
  extensions = {
    live_grep_args = {
      theme = "ivy",
      auto_quoting = true,
      mappings = {
        i = {
          -- NOTE: cheatsheet: https://github.com/nvim-telescope/telescope-live-grep-args.nvim
          ["<C-q>"] = lga_actions.quote_prompt(),
          -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }), -- global but case-i­nse­nsitive
        },
      },
    },
    project = {},
  },
})
