local status, lint = pcall(require, "lint")
if not status then
  print("nvim-lint is not installed")
  return
end

-- NOTE: use the default linter in lsp. For example: sh, yaml,
lint.linters_by_ft = {
  markdown = { "markdownlint" },
  python = { "pylint" },
}

-- NOTE: lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
