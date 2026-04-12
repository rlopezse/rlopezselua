vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>u", "<C-R>")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', {
  desc = 'Claude Code (buffer)'
})

vim.keymap.set('v', '<leader>cc', '<cmd>ClaudeCode<CR>', {
  desc = 'Claude Code (selection)'
})

