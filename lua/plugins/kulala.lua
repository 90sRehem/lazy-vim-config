return {
  "mistweaverco/kulala.nvim",
  opts = {
    -- cURL path
    -- if you have curl installed in a non-standard path,
    -- you can specify it here
    curl_path = "curl",

    -- Display mode, possible values: "split", "float"
    display_mode = "float",

    -- q to close the float (only used when display_mode is set to "float")
    -- possible values: true, false
    q_to_close_float = false,

    -- split direction
    -- possible values: "vertical", "horizontal"
    split_direction = "vertical",

    -- default_view, body or headers or headers_body or verbose
    default_view = "body",

    -- dev, test, prod, can be anything
    -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
    default_env = "dev",

    -- enable/disable debug mode
    debug = false,

    -- default formatters/pathresolver for different content types
    contenttypes = {
      ["application/json"] = {
        ft = "json",
        formatter = { "jq", "." },
        pathresolver = require("kulala.parser.jsonpath").parse,
      },
      ["application/xml"] = {
        ft = "xml",
        formatter = { "xmllint", "--format", "-" },
        pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
      },
      ["text/html"] = {
        ft = "html",
        formatter = { "xmllint", "--format", "--html", "-" },
        pathresolver = {},
      },
    },

    -- can be used to show loading, done and error icons in inlay hints
    -- possible values: "on_request", "above_request", "below_request", or nil to disable
    -- If "above_request" or "below_request" is used, the icons will be shown above or below the request line
    -- Make sure to have a line above or below the request line to show the icons
    show_icons = "on_request",

    -- default icons
    icons = {
      inlay = {
        loading = "⏳",
        done = "✅",
        error = "❌",
      },
      lualine = "🐼",
    },

    -- additional cURL options
    -- see: https://curl.se/docs/manpage.html
    additional_curl_options = {},

    -- scratchpad default contents
    scratchpad_default_contents = {
      "@MY_TOKEN_NAME=my_token_value",
      "",
      "# @name scratchpad",
      "POST https://httpbin.org/post HTTP/1.1",
      "accept: application/json",
      "content-type: application/json",
      "",
      "{",
      '  "foo": "bar"',
      "}",
    },

    -- enable winbar
    winbar = true,

    -- Specify the panes to be displayed by default
    -- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats" },
    default_winbar_panes = { "body", "headers", "headers_body", "verbose" },

    -- enable reading vscode rest client environment variables
    vscode_rest_client_environmentvars = false,

    -- disable the vim.print output of the scripts
    -- they will be still written to disk, but not printed immediately
    disable_script_print_output = false,

    -- set scope for environment and request variables
    -- possible values: b = buffer, g = global
    environment_scope = "b",

    -- certificates
    certificates = {},

    -- Specify how to escape query parameters
    -- possible values: always, skipencoded = keep %xx as is
    urlencode = "always",

    -- enable/disable variable info text
    -- this will show the variable name and value as float
    -- possible values: false, "float"
    show_variable_info_text = false,
  },
  -- set to true to enable default keymaps (check docs or {plugins_path}/kulala.nvim/lua/kulala/config/keymaps.lua for details)
  -- or override default keymaps as shown in the example below.
  ---@type boolean|table
  global_keymaps = false,
  keys = {
    {
      "<leader>Re",
      function()
        require("kulala").set_selected_env()
      end,
      desc = "Selecionar Ambiente", -- Isso aparece no which-key
      mode = "n",
      ft = "http", -- só ativa em arquivos `.http`
    },
  },
  --[[
    {
      ["Send request"] = { -- sets global mapping
        "<leader>Rs",
        function() require("kulala").run() end,
        mode = { "n", "v" }, -- optional mode, default is v
        desc = "Send request" -- optional description, otherwise inferred from the key
      },
      ["Send all requests"] = {
        "<leader>Ra",
        function() require("kulala").run_all() end,
        mode = { "n", "v" },
        ft = "http", -- sets mapping for *.http files only
      },
      ["Replay the last request"] = {
        "<leader>Rr",
        function() require("kulala").replay() end,
        ft = { "http", "rest" }, -- sets mapping for specified file types
      },
    ["Find request"] = false -- set to false to disable
    },
  ]]

  -- Kulala UI keymaps, override with custom keymaps as required (check docs or {plugins_path}/kulala.nvim/lua/kulala/config/keymaps.lua for details)
  ---@type boolean|table
  kulala_keymaps = true,
  --[[
    {
      ["Show headers"] = { "H", function() require("kulala.ui").show_headers() end, },
    }
  ]]
}
