(require 'lsp-javascript-typescript)
(require 'lsp-ui)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; mode hooks
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable)

(setq-default lsp-ui-sideline-show-hover nil)

(provide 'setup-lsp)
