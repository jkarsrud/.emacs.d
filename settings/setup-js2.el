;; All of the js2-mode config stuff

(setq-default js2-allow-rhino-new-expr-initializer nil)
(setq-default js2-auto-indent-p nil)
(setq-default js2-enter-indents-newline nil)
(setq-default js2-global-externs '("module" "require" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
(setq-default js2-idle-timer-delay 0.1)
(setq-default js2-indent-on-enter-key nil)
(setq-default js2-mirror-mode nil)
(setq-default js2-auto-indent-p t)
(setq-default js2-include-rhino-externs nil)
(setq-default js2-include-gears-externs nil)
(setq-default js2-concat-multiline-strings 'eol)
(setq-default js2-rebind-eol-bol-keys nil)
;; Strict warnings off
(setq-default js2-strict-cond-assign-warning nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning nil)
(setq-default js2-strict-var-redeclaration-warning nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-strict-var-hides-function-arg-warning nil)

(setq js-indent-level 2)
(setq-default js2-basic-offset 2)
(setq-default js-switch-indent-offset 2)
;;(setq-default sgml-attribute-offset 2)
(setq-default js2-indent-switch-body t)

;; Flycheck should hande all of this
(setq-default js2-mode-show-err nil)
(setq-default js2-mode-show-warnings nil)
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)

;;(setq-default sgml-basic-offset 2)


;;(add-hook 'js2-mode-hook #'js2-mode-toggle-warnings-and-errors)

(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))
(add-hook 'rjsx-mode-hook (lambda () (flycheck-mode 1)))

(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-x C-m")

(provide 'setup-js2)
