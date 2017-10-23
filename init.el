;; turn off some defaults
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq use-dialog-box nil)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;;(add-to-list 'load-path user-emacs-directory)

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq projects-dir
			(expand-file-name "projects" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path projects-dir)

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

(setq-default create-lockfiles nil)

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
      '(ido
	json
	js2-mode
	js2-refactor
	magit
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
	web-mode
	flycheck
	flycheck-pos-tip
	json-mode
	exec-path-from-shell
	less-css-mode
	find-file-in-project
	editorconfig
	csharp-mode
	yaml-mode
	wakatime-mode
	emojify
	nginx-mode
	coffee-mode
	rjsx-mode
	tide
	flycheck-flow
	elixir-mode
	prettier-js
	add-node-modules-path
	cypher-mode
	))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(when (eq system-type 'darwin)
	(exec-path-from-shell-initialize)
	(setq exec-path-from-shell-arguments '("-l")))

;; Load up some sane defaults
(require 'sane-defaults)

(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'js2-mode '(require 'setup-js2))
(eval-after-load 'tide-mode '(require 'setup-tide))
(require 'setup-prettier)
(require 'setup-ffip)
(require 'setup-autocomplete)
(require 'setup-magit)
(require 'setup-wakatime)
(require 'setup-nginx)
(require 'setup-yasnippet)
;;key bindings
(require 'key-bindings);

;; Enable emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Set column widths to 80, not 72
(setq fill-column 80)

;; Setup font and line stuff
(set-face-attribute 'default nil :font "Fira Code" :height 140)
(setq-default line-spacing 3)

;; Setup editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; Never insert tabs
(set-default 'indent-tabs nil)
(setq-default tab-width 2)

(require 'mode-bindings)
(require 'font-setup)
(require 'project-mode-bindings)

;; Set up web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Display line number column
(global-linum-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Fire up the minor modes the theme we want going all the time everywhere
(load-theme 'solarized t)
(global-undo-tree-mode)
(ido-mode t)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (delete-trailing-whitespace)
  (indent-buffer))

;;
;; Keybindings
;;

;; Find file in project
(global-set-key (kbd "C-x o") 'find-file-in-project)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-n") 'cleanup-buffer)

;; CUSTOM

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(frame-background-mode nil)
 '(package-selected-packages
	 (quote
		(cypher-mode add-node-modules-path company prettier-js elixir-mode flycheck-flow tide rjsx-mode coffee-mode nginx-mode nginx yaml-mode web-mode wakatime-mode undo-tree swiper powerline paredit neotree markdown-mode magit less-css-mode json-mode js2-refactor flycheck-pos-tip find-file-in-project expand-region exec-path-from-shell emojify emmet-mode editorconfig csharp-mode color-theme-solarized cider auto-complete angular-snippets)))
 '(safe-local-variable-values (quote ((js2-basic-offset . 2))))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
