(require 'company)
(require 'company-lsp)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-lsp)
(add-to-list 'company-backends 'company-flow)

(provide 'setup-company-mode)
