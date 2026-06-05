 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#111319',
    base01 = '#1d2025',
    base02 = '#272a30',
    base03 = '#8c919d',
    base04 = '#c2c6d3',
    base05 = '#e1e2ea',
    base06 = '#e1e2ea',
    base07 = '#e1e2ea',
    base08 = '#ffb4ab',
    base09 = '#eeb1ff',
    base0A = '#b2c7ee',
    base0B = '#a7c8ff',
    base0C = '#eeb1ff',
    base0D = '#a7c8ff',
    base0E = '#b2c7ee',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e1e2ea',          bg = '#111319' })
  hi('TelescopeBorder',         { fg = '#8c919d',             bg = '#111319' })
  hi('TelescopePromptNormal',   { fg = '#e1e2ea',          bg = '#111319' })
  hi('TelescopePromptBorder',   { fg = '#8c919d',             bg = '#111319' })
  hi('TelescopePromptPrefix',   { fg = '#a7c8ff',             bg = '#111319' })
  hi('TelescopePromptCounter',  { fg = '#c2c6d3',  bg = '#111319' })
  hi('TelescopePromptTitle',    { fg = '#111319',             bg = '#a7c8ff' })
  hi('TelescopePreviewTitle',   { fg = '#111319',             bg = '#b2c7ee' })
  hi('TelescopeResultsTitle',   { fg = '#111319',             bg = '#eeb1ff' })
  hi('TelescopeSelection',      { fg = '#e1e2ea',          bg = '#272a30' })
  hi('TelescopeSelectionCaret', { fg = '#a7c8ff',             bg = '#272a30' })
  hi('TelescopeMatching',       { fg = '#a7c8ff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
