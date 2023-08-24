;;(require 'tree-sitter)
;;(require 'tree-sitter-langs)

;;(global-tree-sitter-mode)
;;(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq treesit-language-source-alist
      '(
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(provide 'setup-tree-sitter)
