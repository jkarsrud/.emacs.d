(require 'company)
(require 'company-box)

(setq company-idle-delay 0.1
      company-tooltip-limit 16
      company-tooltip-align-annotations t
      company-tooltip-minimum-width 40)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-box-mode)

(provide 'setup-company-mode)
