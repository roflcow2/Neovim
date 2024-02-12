return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim", --Lsp installer
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp", -- Autocompletion plugin
    },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        { "gD", function() vim.lsp.buf.declaration() end },
        { "gd", function() vim.lsp.buf.definition() end },
        { "K", function() vim.lsp.buf.hover() end },
        { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end },
        { "<leader>vd", function() vim.diagnostic.open_float() end },
        { "<leader>vca", function() vim.lsp.buf.code_action() end },
        { "<leader>vrr", function() vim.lsp.buf.references() end },
        { "<leader>vrn", function() vim.lsp.buf.rename() end },
        { "<C-h>", function() vim.lsp.buf.signature_help() end },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup{
            ensure_installed = {"pyright", "lua_ls", "jsonls", "tsserver", "html", "cssls", "bashls"},
        }
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Default require all Lsp Servers
        require("mason-lspconfig").setup_handlers {
            function (server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,
        }
    end

}
