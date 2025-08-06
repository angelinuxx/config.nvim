return {
  {
    "leoluz/nvim-dap-go",
    optional = true, -- Include this spec only if extra.lang.go and extra.dap.core are enabled
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
          -- tell which host and port to connect to
          connect = {
            host = "127.0.0.1",
            port = "9004",
          },
          substitutepath = { {
            from = vim.fn.getcwd(),
            to = "/go/src/app",
          } },
        },
      },
      delve = {
        port = "9004",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "PHP: Listen for XDebug in docker",
          hostname = "0.0.0.0",
          port = 9003,
          log = true,
          pathMappings = {
            ["/var/www/sbam/"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },
}
