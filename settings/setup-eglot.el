(require 'eglot)

(add-hook 'js-ts-mode-hook 'eglot-ensure)
(add-hook 'html-ts-mode-hook 'eglot-ensure)
(add-hook 'css-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'json-ts-mode 'eglot-ensure)

(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))

(defun jkarsrud-try-tsconfig (dir) 
  (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
  (cons 'eglot-project found)))

(add-hook 'project-find-functions 'jkarsrud-try-tsconfig nil nil)

(provide 'setup-eglot)
