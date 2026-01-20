;; Start by setting up some mode mappings for regular modes to treesit-modes just in case
(setq major-mode-remap-alist
 '((yaml-mode . yaml-ts-mode)
   (bash-mode . bash-ts-mode)
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (python-mode . python-ts-mode)))

;; JS
;;(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.m?jsx?$" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.m?tsx?$" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.[mc]js$" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.prettierrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.mjs$" . poly-mjs-mode))

;; Handlebars
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html$" . html-mode))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; PHP
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

;; GROQ
(add-to-list 'auto-mode-alist '("\\.groq$" . groq-mode-hook))

(provide 'mode-bindings)
