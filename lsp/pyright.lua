return {
	cmd = { "pyright-python-langserver", "--stdio" },                                   -- Command to start the language server
	filetypes = { "python" }, -- File types that this server will handle
    settings = {
        pyright = {
            disableOrganizeImports = true
        },
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoImportCompletions = false
            }
        }
    },
}
