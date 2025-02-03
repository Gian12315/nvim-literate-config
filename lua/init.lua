-- [nfnl] Compiled from fnl/init.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local neorg = require("neorg")
  return neorg.setup(opts)
end
return {{"Olical/nfnl", ft = "fennel"}, {"nvim-neorg/neorg", config = _1_, opts = {load = {["core.defaults"] = {}, ["core.concealer"] = {}, ["core.keybinds"] = {}}}}}
