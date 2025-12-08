-- opencode.nvim integration
-- AI assistant for Neovim using opencode CLI
-- https://github.com/NickvanDyke/opencode.nvim
return {
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Required for ask() and select() functionality
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      -- Auto-detect: use tmux when inside a session, otherwise use snacks floating terminal
      local in_tmux = vim.env.TMUX ~= nil
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        provider = {
          enabled = in_tmux and 'tmux' or 'snacks',
          tmux = {
            options = '-h', -- Open in horizontal split
          },
        },
      }

      -- Required for opts.events.reload
      vim.o.autoread = true

      -- Keymaps using <leader>o prefix for opencode
      -- <leader> is <Space> by default in kickstart.nvim
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = '[O]pencode [A]sk' })

      vim.keymap.set({ 'n', 'x' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = '[O]pencode [S]elect action' })

      vim.keymap.set({ 'n', 'x' }, '<leader>op', function()
        require('opencode').prompt('@this')
      end, { desc = '[O]pencode [P]rompt with context' })

      vim.keymap.set({ 'n', 't' }, '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = '[O]pencode [T]oggle' })

      -- Terminal mode: Ctrl+\ Ctrl+n escapes to normal mode (built-in)
      -- Add double-Esc to also escape terminal mode for convenience
      vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      -- Allow Ctrl+w navigation from terminal mode
      vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { desc = 'Window navigation from terminal' })
    end,
  },
}
