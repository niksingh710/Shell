local ok, comment = pcall(require, 'Comment')
if not ok then
  return
end

local keymap = vim.keymap   -- for ease to type
local opts = { silent = true }

local status_ok_comment, cmt = pcall(require, "Comment.api")
if status_ok_comment and cmt["toggle"] ~= nil then
  keymap.set('n', '<leader>/', ":lua require('Comment.api').toggle.linewise.current()<cr>", opts)
  keymap.set('v', '<leader>/', ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
else
  keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', opts)
  keymap.set('v', '<leader>/', ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
end
comment.setup({
  active = true,
  on_config_done = nil,
  padding = true,
  sticky = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = true,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  post_hook = nil,
})
