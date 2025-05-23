local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
        end
    },
    -- { "rebelot/heirline.nvim", lazy = false },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                theme = "auto"
            }
        },
        config = function(_, opts)
            require("lualine").setup(opts)
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = {
        },
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        lazy = false,
        opts = {
            ensure_installed = { "c", "cpp", "lua", "python", "rust" },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true }
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("tokyonight")
        end,
        opts = {
            style = "storm",
            light_style = "day",
            transparent = false,
            terminal_colors = true
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
        end
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path"
        },
        opts = function()
            local cmp = require("cmp")
            local lspkind = require('lspkind')
            local defaults = require("cmp.config.default")()
            return {
                auto_brackets = {},
                completion = {
                    completionopt = "menu,menuone,noinsert"
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    -- ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-j>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false })
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp_document_symbol" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp" },
                    { name = "path" }
                }, {
                    { name = "buffer" }
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        show_labelDetails = true
                    }),
                },
                sorting = defaults.sorting
            }
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
        },
        config = function(_, opts)
            require("ibl").setup(opts)
        end
    },
    {
        "folke/trouble.nvim",
        opts = {
        },
        cmd = "Trouble",
        config = function(_, opts)
            require("trouble").setup(opts)
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
        },
        config = function(_, opts)
            require("telescope").setup(opts)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
        },
        config = function(_, opts)
            require("gitsigns").setup(opts)
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
        },
        config = function(_, opts)
            require("todo-comments").setup(opts)
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
        },
        config = function(_, opts)
            require("lazydev").setup(opts)
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
        },
        config = function(_, opts)
            require("conform").setup(opts)
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "ya2s/nvim-cursorline",
        opts = {
            cursorline = {
                enable = true,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = { underline = true },
            }
        },
        config = function(_, opts)
            require("nvim-cursorline").setup(opts)
        end
    }
})
