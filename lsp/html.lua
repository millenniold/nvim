return {
	cmd = { "vscode-html-language-server", "--stdio" },                                   -- Command to start the language server
	filetypes = { "html" }, -- File types that this server will handle
    capabilities = capabilities,
      init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true,
        },
    },
}
