;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; JS
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.prettierrc$" . json-mode))

;; Handlebars
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; PHP
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(provide 'mode-bindings)
