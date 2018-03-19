(require 'lsp-javascript-typescript)
(require 'lsp-ui)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; mode hooks
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable)

(provide 'setup-lsp)
