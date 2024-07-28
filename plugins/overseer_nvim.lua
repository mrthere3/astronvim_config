return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {},
    config = function()
      local overseer = require "overseer"
      overseer.setup {
        dap = false,
        templates = { "make", "cargo", "shell", "user.run_python", "user.run_script" },
        task_list = {
          direction = "bottom",
          min_height = 15,
          max_height = 25,
          default_detail = 1,
          bindings = {
            ["q"] = function() vim.cmd "OverseerClose" end,
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
          },
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { overseer = true } },
  },
}
