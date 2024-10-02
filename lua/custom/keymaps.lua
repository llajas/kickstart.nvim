-- lua/custom/keymaps.lua

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy to host clipboard in visual mode
set_keymap('v', '<C-c>', '"+y', opts)