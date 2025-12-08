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
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        provider = {
          enabled = 'tmux',
          tmux = {
            options = '-h', -- Open in horizontal split
          },
        },
      }

      -- Required for opts.events.reload
      vim.o.autoread = true

      -- Keymaps (opencode defaults)
      vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = 'Ask opencode' })

      vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
        require('opencode').select()
      end, { desc = 'Execute opencode action…' })

      vim.keymap.set({ 'n', 'x' }, 'ga', function()
        require('opencode').prompt('@this')
      end, { desc = 'Add to opencode' })

      vim.keymap.set({ 'n', 't' }, '<C-.>', function()
        require('opencode').toggle()
      end, { desc = 'Toggle opencode' })

      -- Remap +/- for increment/decrement since <C-a>/<C-x> are used by opencode
      vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
      vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
    end,
  },
}
