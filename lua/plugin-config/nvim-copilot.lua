vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = true,
  ["rust"] = true,
  ["c"] = true,
  ["cpp"] = true,
  ["cs"] = true,
  ["go"] = true,
  ["python"] = true,
  ["sh"] = true,
  ["markdown"] = true,
}

-- Disable Copilot by default
vim.g.copilot_enabled = false

-- vim.api.nvim_command([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
-- NOTE:
-- ref: https://www.reddit.com/r/neovim/comments/sk70rk/using_github_copilot_in_neovim_tab_map_has_been/
vim.g.copilot_assume_mapped = true
