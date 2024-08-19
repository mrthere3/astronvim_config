-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- import/override with your plugins folder
}
