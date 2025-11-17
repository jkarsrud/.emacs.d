(require 'doom-modeline)
(doom-modeline-mode 1)

(when (display-graphic-p)
  (if (find-font(font-spec :family "Symbols Nerd Font Mono"))
      (message "nerd-icons installed")
    (nerd-icons-install-fonts t)))

(provide 'setup-modeline)
