;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-ts-mode))

;; JS
;;(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.[mc]js$" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.prettierrc$" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.prettierrc$" . json-ts-mode))

;; Handlebars
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; PHP
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

;; GROQ
(add-to-list 'auto-mode-alist '("\\.groq$" . groq-mode-hook))

(provide 'mode-bindings)
