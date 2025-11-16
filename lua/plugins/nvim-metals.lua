return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
    }

    metals_config.init_options.statusBarProvider = "off"

    vim.keymap.set("n", "<leader>cL", vim.lsp.codelens.run)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>ws", function()
      require("metals").hover_worksheet()
    end)

    -- all workspace diagnostics
    vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

    -- all workspace errors
    vim.keymap.set("n", "<leader>ae", function()
      vim.diagnostic.setqflist({ severity = "E" })
    end)

    -- all workspace warnings
    vim.keymap.set("n", "<leader>aw", function()
      vim.diagnostic.setqflist({ severity = "W" })
    end)

    -- buffer diagnostics only
    vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

    metals_config.on_attach = function(client, bufnr)
      -- your on_attach function
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}

