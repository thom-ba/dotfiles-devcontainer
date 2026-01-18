
return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- ensure it's loaded before other plugins
    opts = {
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd [[colorscheme tokyonight]]

      -- Force transparency after colorscheme loads
      vim.cmd [[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi FloatBorder guibg=NONE
        hi NormalFloat guibg=NONE
      ]]
    end,
  },
}
