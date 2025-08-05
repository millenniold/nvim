return {
	cmd = { "vscode-json-language-server", "--stdio" },                                   -- Command to start the language server
	filetypes = { "json" }, -- File types that this server will handle
    init_options = {
      provideFormatter = true
    },
    settings = {
      json = {
        validate = { enable = true },
        schemas = require('schemastore').json.schemas(),
      }
    }
}
