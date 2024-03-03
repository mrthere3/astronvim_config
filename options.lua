-- -- set vim options here (vim.<first_key>.<second_key> = value)
-- return {
--   opt = {
--     -- set to true or false etc.
--     relativenumber = true, -- sets vim.opt.relativenumber
--     number = true, -- sets vim.opt.number
--     spell = false, -- sets vim.opt.spell
--     signcolumn = "auto", -- sets vim.opt.signcolumn to auto
--     wrap = false, -- sets vim.opt.wrap
--   },
--   g = {
--     mapleader = " ", -- sets vim.g.mapleader
--     autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
--     cmp_enabled = true, -- enable completion at start
--     autopairs_enabled = true, -- enable autopairs at start
--     diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
--     icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
--     ui_notifications_enabled = true, -- disable notifications when toggling UI elements
--     resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
--   },
-- }
-- If you need more control, you can use the function()...end notation
return function(local_vim)
  vim.opt.relativenumber = true
  vim.g.mapleader = " "
  local_vim.opt.whichwrap = vim.opt.whichwrap - { "b", "s" } -- removing option from list
  local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  vim.opt.number = true
  vim.opt.spell = false
  vim.opt.signcolumn = "auto"
  vim.opt.wrap = false
  vim.g.mapleader = " "
  vim.g.autoformat_enabled = true
  vim.g.cmp_enabled = true
  vim.g.autoformat_enabled = true
  vim.g.diagnostics_mode = 3
  vim.g.autopairs_enabled = true
  vim.g.icons_enabled = true
  vim.g.ui_notifications_enabled = true
  vim.g.resession_enabled = false
  if vim.fn.has "wsl" then
    vim.cmd [[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
  ]]
  end
  if vim.fn.exists "g:neovide" == 1 then
    vim.o.guifont = "CodeNewRoman Nerd Font Mono:h24" -- text below applies for VimScript
    vim.api.nvim_set_var("neovide_refresh_rate", 60)
    local alpha = function() return string.format("%x", math.floor(255 * vim.g.transparency or 0.8)) end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 0.8
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.cmd [[
    " system clipboard
        nmap <c-c> "+y
        vmap <c-c> "+y
        nmap <c-v> "+p
        inoremap <c-v> <c-r>+
        cnoremap <c-v> <c-r>+
        " use <c-r> to insert original character without triggering things like auto-pairs
        inoremap <c-r> <c-v>]]
  end
  return local_vim
end
