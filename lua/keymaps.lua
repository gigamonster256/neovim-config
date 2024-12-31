-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local normalset = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts)
end

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
normalset('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
normalset('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
normalset(']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
normalset('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
normalset('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
normalset('<left>', '<cmd>echo "Use h to move!!"<CR>')
normalset('<right>', '<cmd>echo "Use l to move!!"<CR>')
normalset('<up>', '<cmd>echo "Use k to move!!"<CR>')
normalset('<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
normalset('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
normalset('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
normalset('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
normalset('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
