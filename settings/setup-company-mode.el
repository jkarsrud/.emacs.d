(require 'company)
(require 'company-lsp)
(add-hook 'after-init-hook 'global-company-mode)

(push 'company-lsp company-backends)

(provide 'setup-company-mode)
