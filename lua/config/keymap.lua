-- TODO map Y

vim.keymap.set("n", "<F3>", ":noh<CR>")

vim.keymap.set("n", "<leader>ch", function ()
  require("nvim-navbuddy").open()
end, { desc = "navbuddy" })
vim.keymap.set("n", "<leader>cL", vim.lsp.codelens.run,
  { desc = "codelens" })
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help,
  { desc = "signature" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
  { desc = "rename (`grn`)" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format,
  { desc = "format" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
  { desc = "code action (`gra`)" })

vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist,
  { desc = "workspace diagnostics" }) -- is that trouble ,xX?

vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end, { desc = "workspace errors" })

vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end, { desc = "workspace warnings" })

vim.keymap.set("n", "<leader>ab", vim.diagnostic.setloclist,
  { desc = "buffer diagnostics" })
