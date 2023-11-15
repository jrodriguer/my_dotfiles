local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "html",
    -- "javascript",
    -- "javascriptreact",
    "json",
    "markdown",
    "scss",
    -- "typescript",
    -- "typescriptreact",
    "yaml",
    "lua"
  },
})
