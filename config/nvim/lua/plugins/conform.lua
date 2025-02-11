return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                bash = { "beautysh" },
                sh = { "beautysh" },
                css = { "prettier" },
                json = {"prettier"},
                javascriptreact = {"prettier"},
                typescriptreact = {"prettier"},
                jsx = {"prettier"},
                tsx = {"prettier"},
                html = { "prettier" },
                astro = { "astro" },
                markdown = { "prettier" },
                python = { "black" },
            },
        })
        vim.keymap.set({ "n", "v" }, "<leader>gf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
