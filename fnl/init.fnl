
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

(tx "nvim-neorg/neorg"
     {:opts 
       {:load
         {:core.defaults {}
          :core.concealer {}
          :core.keybinds {}
          }}
      :config (fn [_ opts]
   	     (let [neorg (require :neorg)]
   	       (neorg.setup opts)))})
]
   
