return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documentos/obsidian",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- see below for full list of options 👇
    templates = {
      folder = "~/Documentos/obsidian/templates", -- Pasta onde estão seus templates
      date_format = "%Y-%m-%d", -- Formato de data padrão
      time_format = "%H:%M", -- Formato de hora padrão
      substitutions = {
        date = function()
          return os.date("%d-%m-%Y")
        end,
        time = function()
          return os.date("%H:%M")
        end,
        date_plus_7 = function()
          -- Implementar função para retornar data+7 dias
          local timestamp = os.time() + 7 * 24 * 60 * 60
          return os.date("%d/%m/%Y", timestamp)
        end,
        -- Outras variáveis personalizadas
        week_num = function()
          return os.date("%Y-W%W")
        end,
      },
    },
  },
}
