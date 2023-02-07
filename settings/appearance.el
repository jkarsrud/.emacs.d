(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
(global-hl-line-mode 1)

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

(load-theme 'one-dark t)

;; Diminish all of the modes
(diminish 'yas-minor-mode)
(diminish 'undo-tree-mode)
(diminish 'prettier-js-mode "pjs")
(diminish 'company-box-mode)
(diminish 'company-mode " C")
(diminish 'editorconfig-mode " EC")
(diminish 'projectile-mode " P")
(diminish 'flycheck-mode " lint")

;; Load in rainbow delimiters on every prog mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'appearance)
