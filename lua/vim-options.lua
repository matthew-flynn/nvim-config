vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set list")
vim.cmd("set listchars=tab:›\\ ,eol:¬,trail:⋅,lead:⋅")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.o.foldmethod = "manual" -- Let ufo handle folds
vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for fold calculations
vim.o.foldlevel = 99 -- Ensure folds are expanded by default
vim.o.foldlevelstart = 99 -- Start with everything expanded
vim.o.colorcolumn = "80"
