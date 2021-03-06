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
;;(add-to-list 'load-path "~/.local/share/icons-in-terminal/")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

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
      '(
				add-node-modules-path
				auto-complete
				cider
				clojure-mode
				coffee-mode
				company
				company-box
				company-flow
				company-lsp
				csharp-mode
				cypher-mode
				diminish
				editorconfig
				elcord
				elixir-mode
				emojify
				exec-path-from-shell
				expand-region
				;;find-file-in-project
				flycheck
				flycheck-color-mode-line
				flycheck-flow
				flycheck-pos-tip
				format-sql
				helm
				helm-projectile
				ido
				js2-mode
				js2-refactor
				json
				json-mode
				less-css-mode
				lsp-mode
				lsp-ui
				magit
				magithub
				markdown-mode
				multiple-cursors
				neotree
				nginx-mode
				one-themes
				paredit
				prettier-js
				projectile
				rainbow-delimiters
				rjsx-mode
				tide
				undo-tree
				wakatime-mode
				web-mode
				yaml-mode
				yasnippet
				yasnippet-snippets
				))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(when (eq system-type 'darwin)
	(exec-path-from-shell-initialize)
	(setq exec-path-from-shell-arguments '("-l")))

;; Load up some sane defaults
(require 'sane-defaults)
(require 'setup-org)

(eval-after-load 'flycheck '(require 'setup-flycheck))
(eval-after-load 'js2-mode '(require 'setup-js2))
;; (eval-after-load 'tide-mode '(require 'setup-tide))
;; (require 'setup-powerline)
(require 'setup-prettier)
(require 'setup-ffip)
(require 'setup-projectile)
;;(require 'setup-autocomplete)
(require 'setup-magit)
;;(require 'setup-wakatime)
(require 'setup-nginx)
(require 'setup-yasnippet)
;; Language servers with autocompletes
(require 'setup-lsp)
(require 'setup-company-mode)
;;key bindings
(require 'key-bindings);

;; Enable emojify
;;(add-hook 'after-init-hook #'global-emojify-mode)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Set column widths to 80, not 72
(setq fill-column 80)

;; Setup font and line stuff
(defvar font-height nil "The default font size")
(defvar small-font nil "Is small font active")
(setq font-height 120
			small-font nil)

(defun toggle-font-size ()
	"toggle font size between 12 and 14 pt"
	(interactive)
	(if (bound-and-true-p small-font)
			(setq font-height 140
					 small-font nil)
		(setq font-height 120
				 small-font t))
	(set-face-attribute 'default nil :font "Fira Code" :height font-height))

(defun toggle-font-size-large ()
	"toggle font size between 12 and 14 pt"
	(interactive)
	(if (bound-and-true-p small-font)
			(setq font-height 200
					 small-font nil)
		(setq font-height 180
				 small-font t))
	(set-face-attribute 'default nil :font "Fira Code" :height font-height))

(set-face-attribute 'default nil :font "Fira Code" :height font-height)
(setq-default line-spacing 4)

;; Setup editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; Never insert tabs
(setq-default indent-tabs nil)
(setq-default tab-width 2)

(require 'mode-bindings)
(require 'font-setup)
(require 'project-mode-bindings)

;; Set up web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-html-entities-fontification nil)

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

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Fire up the minor modes the theme we want going all the time everywhere
(global-undo-tree-mode)
(ido-mode t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (delete-trailing-whitespace)
  (indent-buffer))

(defvar dark-theme nil "The dark theme")
(defvar light-theme nil "The light theme")
(defvar active-theme nil "The active theme")

(setq dark-theme 'one-dark
			light-theme 'one-light
			active-theme 'one-dark)

(defun toggle-themes ()
	"toggle themes"
	(interactive)
	(if (eq active-theme light-theme)
			(setq active-theme dark-theme)
		(setq active-theme light-theme))
	(load-theme active-theme t))

(load-theme active-theme t)

(diminish 'yas-minor-mode)
(diminish 'undo-tree-mode)
(diminish 'prettier-js-mode "pretty")
(diminish 'company-box-mode)
(diminish 'company-mode " C")
(diminish 'editorconfig-mode " EC")
(diminish 'projectile-mode " Project")

;;
;; Keybindings
;;

;; Find file in project
(global-set-key (kbd "C-x o") 'find-file-in-project)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c C-n") 'cleanup-buffer)

;; Theme switching
(global-set-key (kbd "C-<f9>") 'toggle-themes)
(global-set-key (kbd "C-<f11>") 'toggle-font-size)
(global-set-key (kbd "C-S-<f11>") 'toggle-font-size-large)

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "yarn eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(global-set-key (kbd "C-c ! F") 'eslint-fix-file-and-revert)
