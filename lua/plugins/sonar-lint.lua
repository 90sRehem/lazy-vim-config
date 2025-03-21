return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          -- Caminhos para os analisadores necessários
          vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"), -- Para JS/TS
          -- vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarhtml.jar"), -- Para HTML
          -- vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarcss.jar"), -- Para CSS
        },
      },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
    })
  end,
}
