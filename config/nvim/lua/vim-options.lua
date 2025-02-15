local opt = vim.opt -- for conciseness

-- Line numbering
opt.relativenumber = true
opt.number = true
opt.showtabline = 2

-- tabs & indentation
opt.tabstop = 2
--opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Autocomando para archivos Lua: tabulación de 4 espacios
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

-- Autocomando para archivos JavaScript y relacionados: tabulación de 2 espacios
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})

-- Line wrapping
opt.wrap = true
--opt.colorcolumn = "80"

-- Search setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
--opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitt Windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
