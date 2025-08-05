return {
	cmd = { "terraform-ls", "serve" },                                   -- Command to start the language server
	filetypes = { "terraform", "tf" }, -- File types that this server will handle
    init_options = {
        ignoreSingleFileWarning = true
    }    
}
