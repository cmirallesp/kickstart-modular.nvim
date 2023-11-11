-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- vim: ts=2 sts=2 sw=2 et
-- set esc in terminal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
-- autoclose eparent
vim.keymap.set('i', '(', '()<left>')
-- Telescope 
vim.keymap.set('n', 'ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', 'gb', '<cmd>Telescope buffers<cr>', { desc = 'Find Files' })
vim.keymap.set('n', 'fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep' })
vim.keymap.set('n', 'gg', '<cmd>Telescope git_files<cr>', { desc = 'Find Git files' })
vim.keymap.set('n', 'fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help tags' })
vim.keymap.set('n', 'fs', '<cmd>Telescope grep_string<cr>', { desc = 'Grep string under cursor' })
