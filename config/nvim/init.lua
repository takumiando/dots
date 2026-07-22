-- Common Vim configuration
local vimrc = vim.env.HOME .. "/.vimrc"

if vim.loop.fs_stat(vimrc) then
  vim.cmd.source(vimrc)
end

-- Neovim-specific configuration
require("statusline").setup()

vim.cmd([[colorscheme ashen]])
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#303030" })
