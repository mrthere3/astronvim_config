return {
  "Zeioth/compiler.nvim",
  dependencies = {
    {
      "stevearc/overseer.nvim",
      -- config = function()
      --   local overseer = require "overseer"
      --   overseer.setup {
      --     dap = false,
      --     templates = { "make", "cargo", "shell", "user.run_python", "user.run_script" },
      --     task_list = {
      --       direction = "bottom",
      --       min_height = 15,
      --       max_height = 25,
      --       default_detail = 1,
      --       bindings = {
      --         ["q"] = function() vim.cmd "OverseerClose" end,
      --         ["<C-u>"] = false,
      --         ["<C-d>"] = false,
      --         ["<C-h>"] = false,
      --         ["<C-j>"] = false,
      --         ["<C-k>"] = false,
      --         ["<C-l>"] = false,
      --       },
      --     },
      --   }
      --   -- custom behavior of make templates
      --   overseer.add_template_hook({
      --     module = "^make$",
      --   }, function(task_defn, util)
      --     util.add_component(task_defn, { "on_output_quickfix", open_on_exit = "failure" })
      --     util.add_component(task_defn, "on_complete_notify")
      --     util.add_component(task_defn, { "display_duration", detail_level = 1 })
      --   end)
      -- end,
    },
  },
  cmd = { "CompilerOpen", "CompilerToggleResults" },
  opts = {},
}
