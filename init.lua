-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tabs
vim.opt.expandtab = false
vim.opt.tabstop = 4
--
-- Numbering
vim.wo.relativenumber = true

-- Initialize lazy
require("config.lazy")
