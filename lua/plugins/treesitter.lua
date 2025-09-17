vim.filetype.add {
  pattern = {
    [".*%.puml"] = "plantuml",
  },
}
return {
  {
    "aklt/plantuml-syntax",
    ft = { "plantuml" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php_only",
      })
    end,
  },
}
