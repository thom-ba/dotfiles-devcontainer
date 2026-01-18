return {
  "neovim/nvim-lspconfig", -- reuse LSP plugin
  config = function()
    -- signs
    local signs = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end

    vim.diagnostic.config({
      virtual_text = true,       -- inline errors
      signs = true,              -- gutter signs
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = "rounded" },
    })
  end,
}
