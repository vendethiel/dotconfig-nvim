-- TODO map Y

vim.keymap.set("n", "<F3>", ":noh<CR>")
vim.keymap.set("n", "gn", "gt") -- Helix...
vim.keymap.set("n", "gp", "gT") -- Helix...

-- Leader
--  + 'c' is code-related (lsp etc)
--  + 'w' is warnings/diagnostics
-- Local leader
-- SPC (pickers)

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
-- Currently this is like `gw`
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format,
  { desc = "format" })

-- # <leader>w -- warnings/diagnostics
-- <leader>ww: Workspace warnings
-- <leader>we: Workspace errors
-- <leader>wa: Workspace diagnostics
-- <leader>wb: Buffer diagnostics
vim.keymap.set("n", "<leader>ww", function()
  vim.diagnostic.setqflist({ severity = "W" })
end, { desc = "diagnostics (warning) for workspace" })
vim.keymap.set("n", "<leader>we", function()
  vim.diagnostic.setqflist({ severity = "E" })
end, { desc = "diagnostics (errors) for workspace" })
vim.keymap.set("n", "<leader>wa", vim.diagnostic.setqflist,
  { desc = "workspace diagnostics" }) -- is that trouble ,xX?
vim.keymap.set("n", "<leader>wb", vim.diagnostic.setloclist,
  { desc = "diagnostics for buffer" })

-- # <localleader>
-- <ll>\D: Virtual line diagnostics
vim.keymap.set('n', '<localleader>D', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- # Pickers
-- <SPC>e: All files
-- <SPC>r: References (to symbol under cursor)
-- <SPC>t: Tabs
-- <SPC>o: File history (only git tracked)
-- <SPC>a: AST (treesitter)
-- <SPC>d: Document symbols (TODO workspace symbols are broken?)
-- <SPC>f: Git-tracked files
-- <SPC>g: Global (Ctrl-P style)
-- <SPC>c (Config)
-- <SPC>ca: Config directory
-- <SPC>cj: JJ config
-- <SPC>cv: neoVim config
-- <SPC>cn: nUshell config
-- <SPC>j: Jumplist
-- <SPC>b: Open buffers
-- <SPC>m: Document methods
-- <SPC>?: Keymap
-- <SPC><SPC>: Resume last finder
-- TODO maybe:
--  o lsp_finder 	All LSP locations, combined view
--  o lsp_workspace_symbols 	Workspace Symbols
local CONFIGS = {
  { "a", "~/.config/", "XDG_CONFIG_HOME", false, },
  { "j", "~/.config/jj/conf.d/", "Jujutsu config", true },
  { "v", "~/.config/nvim/", "Neovim config", true },
  { "n", "~/.config/nushell/", "Nushell config", true },
}
vim.keymap.set("n", " e", ":FzfLua files<CR>",
  { desc = "open files" })
vim.keymap.set("n", " r", ":FzfLua lsp_references<CR>",
  { desc = "symbol references" })
vim.keymap.set("n", " t", ":FzfLua tabs<CR>",
  { desc = "tabs" })
vim.keymap.set("n", " o", "FzfLua combine pickers=oldfiles;git_files", -- ":FzfLua oldfiles<CR>",
  { desc = "oldfiles" })
vim.keymap.set("n", " a", ":FzfLua treesitter<CR>",
  { desc = "AST (treesitter)" })
vim.keymap.set("n", " d", ":FzfLua lsp_document_symbols<CR>",
  { desc = "document symbols" })
vim.keymap.set("n", " f", ":FzfLua git_files<CR>",
  { desc = "open git-tracked files" })
vim.keymap.set("n", " g", ":FzfLua global<CR>",
  { desc = "global" })
vim.keymap.set("n", " j", ":FzfLua jumps<CR>",
  { desc = "jumplist" })
for _, config in ipairs(CONFIGS) do
  local suffix, cwd, desc, is_git = unpack(config)
  vim.keymap.set("n", " c"..suffix, function()
    if is_git then
      FzfLua.git_files({ cwd=cwd })
    else
      FzfLua.files({ cwd=cwd })
    end
  end, { desc = desc })
end
vim.keymap.set("n", " b", ":FzfLua buffers<CR>",
  { desc = "buffers" })
vim.keymap.set("n", " m", ":FzfLua lsp_document_symbols<CR>Methods]",
  { desc = "document methods" })
vim.keymap.set("n", " ?", ":FzfLua keymaps<CR>",
  { desc = "keymap" })
vim.keymap.set("n", "  ", ":FzfLua resume<CR>",
  { desc = "resume last finder" })
