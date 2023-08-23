;;(require 'tree-sitter)
;;(require 'tree-sitter-langs)

;;(global-tree-sitter-mode)
;;(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq treesit-language-source-alist
      '((html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        ))

(provide 'setup-tree-sitter)
