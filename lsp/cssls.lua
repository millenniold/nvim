return {
	cmd = { "vscode-css-language-server", "--stdio" },                                   -- Command to start the language server
	filetypes = { "css", "scss" }, -- File types that this server will handle
	settings = {                                         -- Settings for the language server
        css = { validate = true },
        scss = { validate = true },
	},
}
