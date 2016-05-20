;; turn off some defaults
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq use-dialog-box nil)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;;(add-to-list 'load-path user-emacs-directory)

;; set meta to cmd for mac
(setq mac-command-modifier 'meta
      mac-option-modifier nil
      x-select-enable-clipboard t)

;; show folder name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(setq auto-save-file-name-transforms
         `((".*" ,temporary-file-directory t)))

;; BORING: Ensure everything is UTF-8 all the time
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
 
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(if (string-equal system-type "windows-nt")
    (set-clipboard-coding-system 'utf-16le-dos)
  (set-clipboard-coding-system 'utf-8))

;; Add the fantastic marmalade package repository to your lists to access hundreds of packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(dolist (source package-archives)
  (add-to-list 'package-archives source t))

(package-initialize)

(package-refresh-contents)

;; Automatically install a bunch of useful packages. You should look read up about these.
(setq my-packages
      '(
	ido
	json
	js2-mode
        js2-refactor
	magit
        emmet-mode
	undo-tree
        auto-complete
	clojure-mode
	cider
	expand-region
	multiple-cursors
	markdown-mode
        neotree
	color-theme-solarized
	paredit
	yasnippet
	))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Fire up the minor modes the theme we want going all the time everywhere
(load-theme 'solarized t)
(global-undo-tree-mode)
(ido-mode t)
