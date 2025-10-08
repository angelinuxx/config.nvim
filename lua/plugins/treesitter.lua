vim.filetype.add {
  pattern = {
    [".*%.puml"] = "plantuml",
    [".*%.env.*"] = "dotenv",
  },
}
vim.treesitter.language.register("bash", "dotenv")
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
