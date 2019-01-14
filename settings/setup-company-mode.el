(require 'company)
(require 'company-lsp)
(require 'company-box)

(setq company-idle-delay 0.2
			company-tooltip-limit 10
      company-tooltip-align-annotations t)

(add-hook 'after-init-hook 'global-company-mode)
;;(add-hook 'company-mode-hook 'company-box-mode)

(add-to-list 'company-backends 'company-lsp)

;;(add-to-list 'company-backends 'company-flow)

(provide 'setup-company-mode)
