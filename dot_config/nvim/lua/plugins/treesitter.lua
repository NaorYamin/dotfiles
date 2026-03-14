return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
      -- שימוש ב-pcall מונע מהמסך להפוך לאדום אם המודול חסר
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then 
        return 
      end

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
