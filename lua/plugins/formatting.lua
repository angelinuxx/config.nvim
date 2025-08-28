return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = function()
          if require("util.helpers").has_phpcs_ruleset() then
            return { "phpcbf" }
          else
            return { "pint" }
          end
        end,
      },
      formatters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "--fix", "$FILENAME" },
        },
      },
    },
  },
  {
    "2nthony/sortjson.nvim",
    cmd = {
      "SortJSONByAlphaNum",
      "SortJSONByAlphaNumReverse",
      "SortJSONByKeyLength",
      "SortJSONByKeyLengthReverse",
    },
    keys = {
      { "<leader>js", "<cmd>SortJSONByAlphaNum<cr>", desc = "Sort JSON by alpha num" },
      { "<leader>jS", "<cmd>SortJSONByAlphaNumReverse<cr>", desc = "Sort JSON by alpha num reverse" },
      { "<leader>jk", "<cmd>SortJSONByKeyLength<cr>", desc = "Sort JSON by key length" },
      { "<leader>jK", "<cmd>SortJSONByKeyLengthReverse<cr>", desc = "Sort JSON by key length reverse" },
    },
    config = true,
  },
}
