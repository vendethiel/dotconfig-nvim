return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    statuscolumn = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    --scope = { enabled = true, },
    --words = { enabled = true },
    --terminal = { enabled = true },
  }
}
