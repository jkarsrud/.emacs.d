;;(require 'tree-sitter)
;;(require 'tree-sitter-langs)

;;(global-tree-sitter-mode)
;;(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (css "https://github.com/tree-sitter/tree-sitter-css" "v0.23.0")
        (html "https://github.com/tree-sitter/tree-sitter-html" "v0.23.2")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")))

(provide 'setup-tree-sitter)
