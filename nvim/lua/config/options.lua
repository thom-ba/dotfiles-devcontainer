local opt = vim.opt

vim.opt.clipboard = "unnamedplus"

-- Leader
vim.g.mapleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- True color
opt.termguicolors = true

-- Font (Neovide/GUI)
vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- Basic editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.updatetime = 150
opt.cmdheight = 0
