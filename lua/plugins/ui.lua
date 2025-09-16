local icons = LazyVim.config.icons
local LualineUtil = require "util.lualine"

return {
  {
    "akinsho/bufferline.nvim",
    -- tmp workaround waiting to be merged: https://github.com/LazyVim/LazyVim/pull/6354
    init = function()
      local bufline = require "catppuccin.groups.integrations.bufferline"
      function bufline.get()
        return bufline.get_theme()
      end
    end,
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "phelipetls/jsonpath.nvim" },
    opts = function(_, opts)
      opts.options.component_separators = { left = "󰿟", right = "󰿟" }
      opts.options.section_separators = { left = "", right = "" }
      opts.options.disabled_filetypes.winbar = vim.list_extend(
        opts.options.disabled_filetypes.statusline,
        { "Avante", "AvanteInput", "AvanteSelectedFiles", "noice" }
      )

      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      }

      -- append to lualine_x table the filetype extended
      opts.sections.lualine_x = opts.sections.lualine_x or {}
      table.insert(opts.sections.lualine_x, {
        "filetype",
        icon_only = false,
        separator = "/",
        padding = { left = 1, right = 1 },
      })

      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
        LualineUtil.selectionCount(),
      }

      -- WINBAR
      local jsonpath = require "jsonpath"
      local winbarBase = {
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path { length = 5 } },
        },
        lualine_x = {
          {
            function()
              ---@diagnostic disable-next-line: missing-parameter
              return jsonpath.get()
            end,
            cond = function()
              return vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "json"
            end,
          },
        },
      }
      opts.winbar = winbarBase
      opts.inactive_winbar = winbarBase
      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)
      if vim.g.trouble_lualine and LazyVim.has "trouble.nvim" then
        local trouble = require "trouble"
        local symbols = trouble.statusline {
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        }
        table.insert(opts.winbar.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end

      return opts
    end,
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
▗ ▌ ▘  ▌   ▗    ▘             ▌            
▜▘▛▌▌▛▌▙▘  ▜▘▌▌▌▌▛▘█▌    ▛▘▛▌▛▌█▌  ▛▌▛▌▛▘█▌
▐▖▌▌▌▌▌▛▖  ▐▖▚▚▘▌▙▖▙▖▗   ▙▖▙▌▙▌▙▖  ▙▌▌▌▙▖▙▖
                     ▘                     
            ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      heading = {
        -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = {
        enabled = true,
      },
    },
  },
}
