-- TODO convert this to lazy.nvim

return {
  'L3MON4D3/LuaSnip',
  config = function()
    require('luasnip.loaders.from_snipmate').lazy_load()
    require('luasnip').config.setup({ history = false })

    local luasnip = require('luasnip')

    local jf = function()
      local jmp = luasnip.locally_jumpable(1)
      print(jmp)
      if jmp then luasnip.jump(1) end
    end

    local jb = function()
      local jmp = luasnip.locally_jumpable(-1)
      print(jmp)
      if jmp then luasnip.jump(-1) end
    end
    vim.keymap.set('i', '<C-n>', jf, { remap = false })
    vim.keymap.set('s', '<C-n>', jf, { remap = false })
    vim.keymap.set('i', '<C-p>', jb, { remap = false })
    vim.keymap.set('s', '<C-p>', jb, { remap = false })

    local ls = require("luasnip")
    local i = ls.insert_node
    local t = ls.text_node
    local s = ls.snippet

    ls.add_snippets("lua", {
      s("ternary", {
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
      })
    })
  end
}
-- require('luasnip.loaders.from_snipmate').lazy_load()
-- local luasnip = require('luasnip')
--
-- -- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- vim.keymap.set("i", "<Tab>", function()
--   return luasnip.expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<Tab>'
-- end,
--   { silent = false, expr = true, remap = true })



-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
-- -- -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
