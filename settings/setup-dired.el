;; Add icons to dired
(when (display-graphic-p)
  (require 'all-the-icons)
  (if (find-font(font-spec :name "all-the-icons"))
      (message "all-the-icons installed")
    (all-the-icons-install-fonts t)))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; I don't know why this is t by default
(setq all-the-icons-dired-monochrome nil)

(provide 'setup-dired)
