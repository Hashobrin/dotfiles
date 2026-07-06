-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- meishi: Jinja2 templates live under */templates/**/*.html — treat them as
-- htmldjango so treesitter/emmet/LSP highlight the {{ }} / {% %} syntax.
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.html"] = "htmldjango",
  },
})

