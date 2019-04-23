(require 'helm-projectile)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(add-to-list 'projectile-other-file-alist '("ts" "hbs" "js"))
(add-to-list 'projectile-other-file-alist '("hbs" "ts" "js"))

(provide 'setup-projectile)
