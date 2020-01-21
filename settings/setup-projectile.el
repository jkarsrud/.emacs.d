(require 'helm-projectile)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-after-switch-project-hook 'projectile-vc)

(add-to-list 'projectile-other-file-alist '("ts" "hbs" "js"))
(add-to-list 'projectile-other-file-alist '("hbs" "ts" "js"))
(add-to-list 'projectile-other-file-alist '("ts" "ts" "js" "hbs"))

(provide 'setup-projectile)
