(require 'lsp-mode)
;; mode hooks
(add-hook 'js-mode-hook 'lsp-deferred)
(add-hook 'js2-mode-hook 'lsp-deferred)
(add-hook 'rjsx-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook 'lsp-deferred)

(setq-default lsp-ui-sideline-show-hover nil)
(setq lsp-prefer-flymake nil)

;; Because of LSP, we need to bump our GC threshold
(setq gc-cons-threshold 100000000)

;; Increase process reading to 1MB
(setq read-process-output-max (* 1024 1024))

(setq lsp-completion-provider :capf)

(provide 'setup-lsp)
