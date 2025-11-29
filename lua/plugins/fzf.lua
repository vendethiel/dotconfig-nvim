return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {
    files = {
      find_opts = [[\! -path '*/.git/*' -and \! -path '*/target/*' -and \! -path '*/project/*' -and \! -path '*/.bloop/*' -and \! -path '*/.idea/*' -and \! -path '*/.metals/*' -and \! -path '*/node_modules/*' -and \! -path '*/build/*' -and \! -path '*/dist/*']]
    },
  },
  keys = {
    { "<C-e>", ":FzfLua files<CR>", desc = "Find files" },
  }
}

