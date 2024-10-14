local keyMapper = require 'utils.keyMapper'.mapKey

return {
    {
        'williamboman/mason.nvim',
        config = function()
            require 'mason'.setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require 'mason-lspconfig'.setup {
                ensure_installed = { "lua_ls", "tsserver", "luau_lsp" } 
            }
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require 'lspconfig'
            lspconfig.lua_ls.setup {}
            lspconfig.tsserver.setup {}
            
            keyMapper('K', vim.lsp.buf.hover) 
            keyMapper('gd', vim.lsp.buf.definition)
        end
    }
}
