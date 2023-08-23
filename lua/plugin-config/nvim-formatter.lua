local status, formatter = pcall(require, "formatter")
if not status then
  print("formatter.nvim is not installed")
  return
end

local util = require("formatter.util")

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
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    cs = {
      require("formatter.filetypes.cs").dotnetformat,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

-- NOTE: format on save
vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "FormatAutogroup",
  callback = function()
    local ft = vim.bo.filetype
    -- NOTE: don't format in markdown, norg
    if (ft ~= "markdown") and (ft ~= "norg") then
      vim.cmd("FormatWrite")
    end
  end,
})
