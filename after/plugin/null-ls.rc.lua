local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim.nvim_command [[augroup Format]]
      vim.api.nvim.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim.nvim_command [[autocmd! BufWritePre <buffer> lua vim.lspbuf.formatting_seq_sync()]]
      vim.api.nvim.nvim_command [[augroup END]]
    end
  end,
  soources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.npm_groovy_lint,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.formatting.dart_format
  }
}
