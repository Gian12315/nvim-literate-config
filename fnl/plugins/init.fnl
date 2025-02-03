      (macro tx [& args]
      "Mixed sequential and associative tables at compile time. Because the Neovim ecosystem loves them but Fennel has no neat way to express them (which I think is fine, I don't like the idea of them in general)."
      (let [to-merge (when (table? (. args (length args)))
      (table.remove args))]
      (if to-merge
      (do
      (each [key value (pairs to-merge)]
      (tset args key value))
      args)
      args)))

      [
      (tx "Olical/nfnl" {:ft "fennel"})

      (tx "NeogitOrg/neogit"
          {:dependencies ["nvim-lua/plenary.nvim"        
                          "sindrets/diffview.nvim"      
                          "nvim-telescope/telescope.nvim"
                          ]})
              

      (tx "nvim-treesitter/nvim-treesitter"
      {:main :nvim-treesitter.configs
      :opts {:auto_install true
      :highlight {:enable true}}})

      (tx "atweiden/vim-fennel")

      (tx "marko-cerovac/material.nvim"
      {:opts {:plugins ["neorg" "which-key"]}
      :config (fn [_ opts]
      (let [material (require :material)]
      (material.setup opts)
      (set vim.g.material_style "deep ocean")
      (vim.cmd "colorscheme material")))})

      (tx "nvim-neorg/neorg"
   {:opts 
     {:load
       {:core.defaults {}
        :core.concealer {}
        :core.keybinds {}
        }}
    :config 
    (fn [_ opts]
      (let [neorg (require :neorg)
            nfnl (require :nfnl.api)]
      (neorg.setup opts)
      (vim.api.nvim_create_user_command "NeorgTangleAndNfnlCompile" (fn [_]
      (vim.cmd "Neorg tangle current-file")

        (nfnl.compile-all-files)
      ) {})
      ))})
      ]
 