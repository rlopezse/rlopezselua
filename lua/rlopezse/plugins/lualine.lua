return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    event = "VeryLazy",
    config = function()
      local c = require("catppuccin.palettes").get_palette("mocha")

      local bar = c.mantle
      local mode_colors = {
        n = c.lavender,
        i = c.green,
        v = c.mauve,
        V = c.mauve,
        ["\22"] = c.mauve,
        c = c.peach,
        R = c.red,
        t = c.green,
      }

      local function mode_color()
        return { bg = mode_colors[vim.fn.mode()] or c.lavender, fg = c.crust, gui = "bold" }
      end

      local theme = {}
      for _, m in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
        theme[m] = {
          a = { bg = bar, fg = c.text },
          b = { bg = bar, fg = c.subtext0 },
          c = { bg = bar, fg = c.subtext0 },
        }
      end

      local left_round = { left = "", right = "" }
      local pill = { left = "", right = "" }

      local function lsp_name()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        return #clients > 0 and "Lsp" or ""
      end

      require("lualine").setup({
        options = {
          theme = theme,
          globalstatus = true,
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            {
              function()
                local names = {
                  n = "NORMAL", i = "INSERT", v = "VISUAL", V = "V-LINE", ["\22"] = "V-BLOCK",
                  c = "COMMAND", R = "REPLACE", t = "TERMINAL",
                }
                return "󰰄 " .. (names[vim.fn.mode()] or vim.fn.mode():upper())
              end,
              color = mode_color,
              separator = left_round,
              padding = { left = 1, right = 1 },
            },
          },
          lualine_b = {
            { "progress", color = { fg = c.subtext0 } },
            { "location", color = { fg = c.subtext0 } },
          },
          lualine_c = {
            {
              "diagnostics",
              sections = { "error", "warn", "info", "hint" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              diagnostics_color = {
                error = { fg = c.red },
                warn = { fg = c.yellow },
                info = { fg = c.sky },
                hint = { fg = c.teal },
              },
              colored = true,
              always_visible = false,
              fmt = function(s) return s end,
            },
          },
          lualine_x = {
            { lsp_name, icon = { "", color = { fg = c.overlay1 } }, color = { fg = c.overlay1 } },
          },
          lualine_y = {
            {
              "filetype",
              icon_only = false,
              colored = false,
              color = { bg = c.red, fg = c.crust, gui = "bold" },
              separator = pill,
              padding = { left = 1, right = 1 },
            },
          },
          lualine_z = {
            {
              function() return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
              color = { bg = c.pink, fg = c.crust, gui = "bold" },
              separator = pill,
              padding = { left = 1, right = 1 },
            },
          },
        },
        inactive_sections = {},
      })
    end,
  },
}
