-- -- avoid loading twice
-- if vim.fn.exists("current_compiler") then
--   return
-- end
-- vim.g.current_compiler = "python"
--
-- local winnr = vim.fn.win_getid()
-- local bufnr = vim.api.nvim_win_get_buf(winnr)
-- vim.api.nvim_buf_set_option(bufnr, "makeprg", "python3 %")
-- vim.api_nvim_buf_set_option(
--   bufnr,
--   "errorformat",
--   [[
--         \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
--         \%*\\sFile\ \"%f\"\\,\ line\ %l,
--   ]]
-- )
