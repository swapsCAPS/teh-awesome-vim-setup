local cmp = require("cmp")

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

function OnTab(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn["vsnip#available"](1) == 1 then
    feedkey("<Plug>(vsnip-expand-or-jump)", "")
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()     -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
  end
end

function OnShiftTab()
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    feedkey("<Plug>(vsnip-jump-prev)", "")
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(OnTab, { "i", "s" }),
    ["<Shift-Tab>"] = cmp.mapping(OnShiftTab, { "i", "s" }),
    ['<Ctrl-Space>'] = cmp.mapping.complete(),
    ['<Ctrl-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }, {
    { name = 'rg' },
  }, {
    { name = 'spell' },
  })
})
