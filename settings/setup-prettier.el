(require 'prettier-js)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(add-hook 'web-mode-hook #'add-node-modules-path)
(add-hook 'web-mode-hook 'prettier-js-mode)

(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)

(provide 'setup-prettier)
