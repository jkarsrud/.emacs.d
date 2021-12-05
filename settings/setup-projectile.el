(require 'helm-projectile)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-after-switch-project-hook 'projectile-vc)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(add-to-list 'projectile-other-file-alist '("ts" "hbs" "js"))
(add-to-list 'projectile-other-file-alist '("js" "hbs"))
(add-to-list 'projectile-other-file-alist '("hbs" "ts" "js"))
(add-to-list 'projectile-other-file-alist '("ts" "ts" "js" "hbs"))

(provide 'setup-projectile)
