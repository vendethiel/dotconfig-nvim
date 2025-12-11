-- TODO map Y

vim.keymap.set("n", "<F3>", ":noh<CR>")

-- Leader prefixes:
--  + 'c' is code-related (lsp etc)
--  + 'w' is warnings/diagnostics
-- Local leader prefixes:
-- SPC = pickers

-- # <leader>c -- code-related
-- ,ch: Code hierarchy (navbuddy)
-- ,cl: Code lens
-- ,cs: Signature
-- ,cs: Format file
vim.keymap.set("n", "<leader>ch", function ()
  require("nvim-navbuddy").open()
end, { desc = "navbuddy" })
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run,
  { desc = "codelens" })
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help,
  { desc = "signature" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format,
  { desc = "format" })

-- # <leader>w -- warnings/diagnostics
vim.keymap.set("n", "<leader>wa", vim.diagnostic.setqflist,
  { desc = "workspace diagnostics" }) -- is that trouble ,xX?
vim.keymap.set("n", "<leader>we", function()
  vim.diagnostic.setqflist({ severity = "E" })
end, { desc = "diagnostics (errors) for workspace" })
vim.keymap.set("n", "<leader>ww", function()
  vim.diagnostic.setqflist({ severity = "W" })
end, { desc = "diagnostics (warning) for workspace" })
vim.keymap.set("n", "<leader>wb", vim.diagnostic.setloclist,
  { desc = "diagnostics for buffer" })

-- # Pickers
-- <SPC>e: All files
-- <SPC>r: References (to symbol under cursor)
-- <SPC>t: Tabs
-- <SPC>a: AST (treesitter)
-- <SPC>d: Document symbols (TODO workspace symbols are broken?)
-- <SPC>f: Git-tracked files
-- <SPC>j: Jumplist
-- <SPC>b: Open buffers
-- <SPC>?: Keymap
-- <SPC><SPC>: Resume last finder
vim.keymap.set("n", " e", ":FzfLua files<CR>",
  { desc = "open files" })
vim.keymap.set("n", " r", ":FzfLua lsp_references<CR>",
  { desc = "symbol references" })
vim.keymap.set("n", " t", ":FzfLua tabs<CR>",
  { desc = "tabs" })
vim.keymap.set("n", " a", ":FzfLua treesitter<CR>",
  { desc = "AST (treesitter)" })
vim.keymap.set("n", " d", ":FzfLua lsp_document_symbols<CR>",
  { desc = "document symbols" })
vim.keymap.set("n", " f", ":FzfLua git_files<CR>",
  { desc = "open git-tracked files" })
vim.keymap.set("n", " j", ":FzfLua jumps<CR>",
  { desc = "jumplist" })
vim.keymap.set("n", " b", ":FzfLua buffers<CR>",
  { desc = "buffers" })
vim.keymap.set("n", " ?", ":FzfLua keymaps<CR>",
  { desc = "keymap" })
vim.keymap.set("n", "  ", ":FzfLua resume<CR>",
  { desc = "resume last finder" })
