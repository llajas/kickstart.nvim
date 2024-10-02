-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- ~/.config/nvim/lua/custom/plugins/init.lua

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Existing plugins can be listed here
  -- e.g., use 'nvim-treesitter/nvim-treesitter'

  -- Add onedark.nvim theme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker', -- Choose your preferred style
        transparent = false, -- Enable or disable transparent background
        term_colors = true, -- Enable terminal colors
        ending_tildes = false, -- Show end-of-buffer tildes
        cmp_itemkind_reverse = false, -- Reverse CMP item kind highlights

        -- Toggle theme style (optional)
        toggle_style_key = '<leader>ts', -- Set your keybinding
        toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

        -- Change code style
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },

        -- Lualine options
        lualine = {
          transparent = false, -- Lualine center bar transparency
        },

        -- Custom Highlights (optional)
        colors = {
          bright_orange = "#ff8800",
          green = '#00ffaa',
        },
        highlights = {
          ["@keyword"] = {fg = '$green'},
          ["@string"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
          ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
          ["@function.builtin"] = {fg = '#0059ff'}
        },

        -- Plugins Config
        diagnostics = {
          darker = true, -- Darker colors for diagnostic
          undercurl = true, -- Use undercurl instead of underline for diagnostics
          background = true, -- Use background color for virtual text
        },
      }
      require('onedark').load()
    end
  }

  -- Add Lualine if not already added
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Add more plugins here
  -- ...
end)