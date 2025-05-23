local opts = {
    noremap = true,
    silent = true
}

vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
