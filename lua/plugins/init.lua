-- [nfnl] Compiled from fnl/plugins/init.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local material = require("material")
  material.setup(opts)
  vim.g.material_style = "deep ocean"
  return vim.cmd("colorscheme material")
end
local function _2_(_, opts)
  local neorg = require("neorg")
  local nfnl = require("nfnl.api")
  neorg.setup(opts)
  local function _3_(_0)
    vim.cmd("Neorg tangle current-file")
    return nfnl["compile-all-files"]()
  end
  return vim.api.nvim_create_user_command("NeorgTangleAndNfnlCompile", _3_, {})
end
local function _4_(_, opts)
  local lspconfig = require("lspconfig")
  for server, config in pairs(opts.servers) do
    config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
  end
  return nil
end
return {{"Olical/nfnl", ft = "fennel"}, {"NeogitOrg/neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"}}, {"nvim-treesitter/nvim-treesitter", main = "nvim-treesitter.configs", opts = {auto_install = true, highlight = {enable = true}}}, {"atweiden/vim-fennel"}, {"marko-cerovac/material.nvim", config = _1_, opts = {plugins = {"neorg", "which-key"}}}, {"nvim-neorg/neorg", config = _2_, opts = {load = {["core.defaults"] = {}, ["core.concealer"] = {}, ["core.keybinds"] = {}, ["core.export"] = {}}}}, {"williamboman/mason.nvim", opts = {}}, {"williamboman/mason-lspconfig.nvim", opts = {}}, {"saghen/blink.cmp", opts = {keymap = {preset = "default"}, appearance = {nerd_font_variant = "mono"}}, version = "*"}, {"neovim/nvim-lspconfig", config = _4_, dependencies = {"saghen/blink.cmp"}, opts = {servers = {pyright = {}}}}}
