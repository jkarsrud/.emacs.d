(defvar light-theme 'one-light "The light theme")
(defvar dark-theme 'one-dark "The dark theme")
(defvar active-theme dark-theme "The active theme")

(defun toggle-theme ()
  "Toggle light/dark theme"
  (interactive)
  (if (eq active-theme light-theme)
      (setq active-theme dark-theme)
    (setq active-theme light-theme))
  (load-theme active-theme t))

(load-theme active-theme t)

;; Theme switching
(global-set-key (kbd "C-<f9>") 'toggle-theme)

(provide 'load-theme)
