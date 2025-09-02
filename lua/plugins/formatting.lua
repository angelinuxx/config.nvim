local helpers = require("util.helpers")
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = function()
          if helpers.has_local_phpcs_ruleset() then
            return { "phpcbf" } -- use only local rules
          else
            return { "pint" } -- use pint if there is no phpcs ruleset in cwd
          end
        end,
        xml = { "xmlformatter" },
      },
      formatters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            vim.fn.stdpath("config") .. "/global-configs/.markdownlint-cli2.yaml",
            "--fix",
            "$FILENAME",
          },
        },
        xmlformatter = {
          prepend_args = { "--selfclose" },
        },
        pint = {
          command = "pint",
          args = function()
            if helpers.has_local_pint_ruleset() then
              return { "$FILENAME" } --- local config exists, just pass the file
            else
              local global_config = vim.fn.stdpath("config") .. "/global-configs/pint.json"
              return { "$FILENAME", "--config=" .. global_config } -- pass the global config
            end
          end,
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
