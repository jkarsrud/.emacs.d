(require 'lsp)
(require 'lsp-clients)

;; mode hooks
(add-hook 'js-mode-hook 'lsp)
(add-hook 'js2-mode-hook 'lsp)
(add-hook 'rjsx-mode-hook 'lsp)
(add-hook 'typescript-mode-hook 'lsp)

(setq-default lsp-ui-sideline-show-hover nil)

(provide 'setup-lsp)
