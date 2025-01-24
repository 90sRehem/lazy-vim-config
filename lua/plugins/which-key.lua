return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      window = {
        position = "top", -- mude para a posição desejada
      },
    })
  end,
}
