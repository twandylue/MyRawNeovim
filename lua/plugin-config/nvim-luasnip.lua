local status_vscode, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status_vscode then
  print("luasnip_vscode is not installed")
  return
end

from_vscode.lazy_load({ include = { "python", "rust", "cpp", "c" } })
