(require 'prettier-js)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'scss-mode-hook #'add-node-modules-path)
(add-hook 'web-mode-hook #'add-node-modules-path)
(add-hook 'typescript-mode-hook #'add-node-modules-path)
(add-hook 'css-mode-hook #'add-node-modules-path)

(add-hook 'js-ts-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'scss-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)
(add-hook 'css-ts-mode-hook 'prettier-js-mode)
(add-hook 'groq-mode-hook 'prettier-js-mode)
(add-hook 'json-ts-mode-hook 'prettier-js-mode)
(add-hook 'html-ts-mode-hook 'prettier-js-mode)
(add-hook 'html-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)

(provide 'setup-prettier)
;;; setup-prettier.el ends here
