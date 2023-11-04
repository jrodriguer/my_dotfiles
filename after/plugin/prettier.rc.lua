local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', 
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = true,
    jsx_single_quote = true,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = false,
    single_attribute_per_line = false,
    single_quote = true,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = true,
    vue_indent_script_and_style = true,
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  }
})
