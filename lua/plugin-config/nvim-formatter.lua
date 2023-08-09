local status, formatter = pcall(require, "formatter")
if not status then
  print("formatter.nvim is not installed")
  return
end

local util = require("formatter.util")

-- NOTE: Use the formatter in lsp: c, rust
formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    sh = {
      require("formatter.filetypes.sh").shfmt,
      function()
        return {
          exe = "shellharden",
          args = {
            "--replace",
            "--",
          },
          stdin = false,
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

-- NOTE: format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])
