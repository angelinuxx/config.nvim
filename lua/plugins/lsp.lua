return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "emmet-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- stylua: ignore
      ---@type lspconfig.options
      servers = {
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
        emmet_language_server = {
          filetypes = {
            "html",
            "blade",
            "css",
            "sass",
            "scss",
            "less",
            "javascript",
            "typescript",
            "markdown",
          },
        },
        phpactor = {
          settings = {
            phpactor = {
              -- Stubs for Frameworks (Laravel, Symfony, etc.)
              ["language_server_stubs.enabled"] = true,
              ["language_server_stubs.paths"] = {
                "vendor/barryvdh/laravel-ide-helper", -- This is vital for Laravel facades and models
                -- Add more stub paths if you use other libraries that provide stubs
              },
              -- Ensure Laravel itself is enabled as a stub set
              ["language_server_stubs.stubs"] = {
                "standard",
                "Core",
                "PDO",
                "Laravel", -- <--- Make sure this is present and enabled
              },
            },
          },
        },
        intelephense = {
          settings = {
            intelephense = {
              -- Ensure these are NOT set to true, or are commented out
              -- If these are true, it might be relaxing type checks
              -- diagnostics.relaxedTypeCheck might ignore certain type mismatches
              -- diagnostics.noMixedTypeCheck might ignore 'mixed' type usage
              -- (though this is less directly related to undefined static methods)
              -- Consider setting these to false or omitting them for stricter checks.
              -- diagnostics = {
              --   relaxedTypeCheck = false,
              --   noMixedTypeCheck = false,
              -- },

              -- Ensure that "undefined" diagnostics are enabled
              diagnostics = {
                undefinedClass = true,
                undefinedFunction = true,
                undefinedConstant = true,
                undefinedMethod = true, -- THIS IS CRUCIAL FOR YOUR ISSUE
                undefinedProperty = true,
                -- ... other diagnostics
              },
              -- You might also have a strict mode setting, ensure it's not too relaxed
              -- Or look for 'strict' or 'analysis' related settings.
              -- Often, the default is already quite strict for these.
            },
          },
        },
      },
    },
  },
}
