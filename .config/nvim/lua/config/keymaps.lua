local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch
keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Increment/decrement highlighted number
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<CR>', { unpack(opts), desc = 'Add new tab' })
keymap.set('n', '<tab>', ':tabnext<CR>', { unpack(opts), desc = 'Next tab' })
keymap.set('n', '<S-tab>', ':tabprev<CR>', { unpack(opts), desc = 'Prev tab' })

-- Split window
keymap.set('n', 'ss', ':split<CR>', { unpack(opts), desc = 'Split window horizontally' })
keymap.set('n', 'sv', ':vsplit<CR>', { unpack(opts), desc = 'Split window vertically' })

-- Move between windows
keymap.set('n', 'sh', '<C-w>h', { desc = 'Move to left window' })
keymap.set('n', 'sk', '<C-w>k', { desc = 'Move to top window' })
keymap.set('n', 'sj', '<C-w>j', { desc = 'Move to bottom window' })
keymap.set('n', 'sl', '<C-w>l', { desc = 'Move to right window' })

keymap.set('n', '<C-w><left>', '<C-w><', { desc = 'Resize left window' })
keymap.set('n', '<C-w><right>', '<C-w>>', { desc = 'Resize right window' })
keymap.set('n', '<C-w><up>', '<C-w>+', { desc = 'Resize top window' })
keymap.set('n', '<C-w><down>', '<C-w>-', { desc = 'Resize window to the bottom' })

-- Diagnostic keymaps
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Convenience ]]
keymap.set('n', '<leader>pv', '<cmd>Ex<CR>')
-- vim: ts=2 sts=2 sw=2 et
