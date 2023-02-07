;; Turn off some defaults
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq use-dialog-box nil)


;; Remove security vulnerability
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path settings-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     company
     company-box
     dash
     diminish
     editorconfig
     helm-projectile
     flycheck
     flycheck-color-mode-line
     flycheck-flow
     flycheck-pos-tip
     js2-mode
     js2-refactor
     lsp-mode
     lsp-ui
     magit
     magit-gitflow
     markdown-mode
     one-themes
     prettier-js
     projectile
     rainbow-delimiters
     undo-tree
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Start with going sane
(require 'sane-defaults)

;; Theme setup
(require 'load-theme)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Setup editorconfig
(require 'editorconfig)
(editorconfig-mode 1)


(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'js2-mode '(require 'setup-js2))
(require 'setup-prettier)
(require 'setup-projectile)
(require 'setup-magit)
(require 'setup-company-mode)
(require 'setup-lsp)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Load in rainbow delimiters on every prog mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Custom key bindings
(require 'key-bindings)

;; Custom mode bindings
(require 'mode-bindings)

;; Diminish all of the modes
(diminish 'yas-minor-mode)
(diminish 'undo-tree-mode)
(diminish 'prettier-js-mode "pjs")
(diminish 'company-box-mode)
(diminish 'company-mode " C")
(diminish 'editorconfig-mode " EC")
(diminish 'projectile-mode " P")
(diminish 'flycheck-mode " lint")

(defvar undo-directory (concat user-emacs-directory "undo/")
  "Directory to save undo history files.")
(unless (file-exists-p undo-directory)
  (make-directory undo-directory t))
;; stop littering with *.~undo-tree~ files everywhere
(setq undo-tree-history-directory-alist `(("." . ,undo-directory)))

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
