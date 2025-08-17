-- Retrieves configuration at "/nvim/lua/config" directory
-- @param {string} get the path directory via config.*
--
-- @example
-- if you have "nvim/lua/config/keymaps"
-- require("config.keymaps") -- where the directory is in "/config/keymaps"

require("config.lazy")
require("config.keymaps")

-- Custom Vim configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
