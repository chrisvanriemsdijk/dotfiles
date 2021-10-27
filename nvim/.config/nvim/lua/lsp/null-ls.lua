local lsc = require('lspconfig')
local nls = require('null-ls')
local cmd = vim.api.nvim_command
local fmt = nls.builtins.formatting

-- Configuring null-ls
nls.config({
    sources = {
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'yaml', 'toml', 'make', 'conf', 'tmux' },
        }),
        fmt.rustfmt,
--        fmt.stylua,
        fmt.terraform_fmt,
        fmt.prettierd,
        fmt.black,
    },
})

-- NOTE: don't move this setup() call elsewhere
lsc['null-ls'].setup({
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
      end
    end,
})
