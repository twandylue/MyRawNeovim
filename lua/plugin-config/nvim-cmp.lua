local status, cmp = pcall(require, "cmp")
if not status then
  print("nvim-cmp is not installed")
  return
end
-- NOTE: Disable LSP
-- local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-y>"] = cmp.mapping.scroll_docs(-4),
    ["<C-e>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<TAB>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.insert,
      select = true,
    }),
  }),
  sources = cmp.config.sources({
    -- NOTE: Disable LSP
    -- { name = "nvim_lsp" },
    { name = "luasnip", option = { use_show_condition = false } },
    { name = "buffer" },
  }),
  formatting = {
    -- NOTE: Disable LSP
    -- format = lspkind.cmp_format({
    --   writh_text = false,
    --   maxwidth = 50,
    -- }),
  },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
