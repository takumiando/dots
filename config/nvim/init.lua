-- Load common vimrc if it exists
local vimrc = vim.env.HOME .. "/.vimrc"
if vim.loop.fs_stat(vimrc) then
  vim.cmd.source(vimrc)
end

require("statusline").setup()

vim.cmd[[colorscheme ashen]]
