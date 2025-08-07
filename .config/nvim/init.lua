vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- keymaps

local Snacks = require("snacks")

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.explorer({
    layout = "default",
    focus = "input",
    auto_close = true,
    jump = {
      close = true,
      open = true
    },
  })
end, {})
vim.keymap.set("n", "<C-M-p>", Snacks.picker.grep, {})

vim.keymap.set("n", "<C-n>", Snacks.picker.lsp_symbols, {})
vim.keymap.set("n", "<C-M-n>", Snacks.picker.lsp_workspace_symbols, {})
vim.keymap.set("n", "<C-m>", Snacks.picker.diagnostics_buffer, {})
vim.keymap.set("n", "<C-M-m>", Snacks.picker.diagnostics, {})

vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, {})
vim.keymap.set("n", "gr", Snacks.picker.lsp_references, {})

vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})

-- vim options

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.cmd("colorscheme moonfly")
vim.cmd("set termguicolors")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
  virtual_text = true
})
