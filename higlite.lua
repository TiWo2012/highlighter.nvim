local function set_syntax_highlighting()
    local file_extension = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":e")

    -- Mapping of extensions to filetypes
    local syntax_map = {
        lua = "lua",
        py = "python",
        js = "javascript",
        ts = "typescript",
        html = "html",
        css = "css",
        json = "json",
        md = "markdown",
        sh = "sh",
	cpp = "cpp",
	hpp = "cpp",
	c = "c",
	h = "c",
    }

    -- Check if the extension exists in the map
    local filetype = syntax_map[file_extension]
    if filetype then
        vim.bo.filetype = filetype -- Set the filetype
        print("Syntax highlighting set to:", filetype)
    else
        print("No syntax highlighting available for extension:", file_extension)
    end
end

-- Automatically set syntax highlighting when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = set_syntax_highlighting,
})
