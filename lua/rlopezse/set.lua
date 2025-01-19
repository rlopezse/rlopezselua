vim.opt.nu = true
vim.opt.relativenumber=true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff=8
vim.opt.signcolumn="yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.ignorecase = true

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--vim.opt.wrap = false

