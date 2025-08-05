vim.lsp.enable({
    "gopls",
    "tsserver",
    "pyright",
    "html",
    "cssls",
    "jsonls",
    "clangd",
    "terraform-ls",
    "helm-ls",
    "lua_ls"
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- Toggle warning/error inline messages
vim.keymap.set("n", "<leader>m", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
  print("Virtual text " .. (not current and "enabled" or "disabled"))
end, { desc = "Toggle LSP virtual text" })
