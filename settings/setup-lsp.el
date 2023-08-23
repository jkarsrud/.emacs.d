(require 'lsp-mode)
(require 'lsp-ui)
;; Code:
;; mode hooks
(add-hook 'js-ts-mode-hook 'lsp-deferred)
(add-hook 'js2-mode-hook 'lsp-deferred)
(add-hook 'rjsx-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'elixir-mode-hook 'lsp-deferred)
(add-hook 'web-mode-hook 'lsp-deferred)
(add-hook 'html-mode-hook 'lsp-deferred);


(setq-default lsp-ui-sideline-show-hover nil)

(setq lsp-prefer-flymake t)

;; Because of LSP, we need to bump our GC threshold
(setq gc-cons-threshold 100000000)

;; Increase process reading to 1MB
(setq read-process-output-max (* 1024 1024))

(setq lsp-completion-provider :capf)

(setq lsp-tailwindcss-add-on-mode t)

(setq lsp-ui-doc-enable t)
(setq lsp-ui-peek-enable t)

(setq lsp-modeline-diagnostics-enable t)
(setq lsp-modeline-code-actions-segments '(count name))


;; Elixir LSP-stuff
;;(setq lsp-elixir-local-server-command "~/lsp-servers/elixir-ls/language_server.sh")
;;(add-to-list 'lsp-language-id-configuration '(".*\\.heex$" . "html"))

;;(setq 'lsp-language-id-configuration (remove '(".*\\.heex$" . "html") 'lsp-language-id-configuration))

(provide 'setup-lsp)
