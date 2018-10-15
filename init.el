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
      '(
				add-node-modules-path
				ample-theme
				auto-complete
				cider
				clojure-mode
				coffee-mode
				company
				company-flow
				company-lsp
				csharp-mode
				cypher-mode
				editorconfig
				elcord
				elixir-mode
				emojify
				exec-path-from-shell
				expand-region
				find-file-in-project
				flycheck
				flycheck-flow
				flycheck-pos-tip
				ido
				js2-mode
				js2-refactor
				json
				json-mode
				less-css-mode
				lsp-javascript-flow
				lsp-javascript-typescript
				lsp-mode
				lsp-ui
				magit
				magithub
				markdown-mode
				multiple-cursors
				neotree
				nginx-mode
				paredit
				prettier-js
				rainbow-delimiters
				rjsx-mode
				solarized-theme
				tide
				undo-tree
				wakatime-mode
				web-mode
				yaml-mode
				yasnippet
				flycheck-color-mode-line
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
;; (require 'setup-powerline)
(require 'setup-prettier)
(require 'setup-ffip)
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

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

(defvar dark-theme nil "The dark theme")
(defvar light-theme nil "The light theme")
(defvar active-theme nil "The active theme")

(setq dark-theme 'ample
			light-theme 'ample-light
			active-theme 'ample)

(defun toggle-themes ()
	"toggle themes"
	(interactive)
	(if (eq active-theme light-theme)
			(setq active-theme dark-theme)
		(setq active-theme light-theme))
	(load-theme active-theme t))

(load-theme active-theme t)

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

;; CUSTOM

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(flycheck-javascript-flow-args nil)
 '(frame-background-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(magit-commit-arguments (quote ("--gpg-sign=328E6F61064CF7CD")))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
	 (quote
		(flycheck-color-mode-line magithub elcord rainbow-delimiters ample-theme solarized-theme lsp-javascript-flow company-flow company-lsp lsp-ui company-mode lsp-javascript-typescript lsp-mode cypher-mode add-node-modules-path company prettier-js elixir-mode flycheck-flow tide rjsx-mode coffee-mode nginx-mode nginx yaml-mode web-mode wakatime-mode undo-tree swiper paredit neotree markdown-mode magit less-css-mode json-mode js2-refactor flycheck-pos-tip find-file-in-project expand-region exec-path-from-shell emojify emmet-mode editorconfig csharp-mode color-theme-solarized cider auto-complete angular-snippets)))
 '(safe-local-variable-values (quote ((js2-basic-offset . 2))))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
	 (quote
		((20 . "#dc322f")
		 (40 . "#c9485ddd1797")
		 (60 . "#bf7e73b30bcb")
		 (80 . "#b58900")
		 (100 . "#a5a58ee30000")
		 (120 . "#9d9d91910000")
		 (140 . "#9595943e0000")
		 (160 . "#8d8d96eb0000")
		 (180 . "#859900")
		 (200 . "#67119c4632dd")
		 (220 . "#57d79d9d4c4c")
		 (240 . "#489d9ef365ba")
		 (260 . "#3963a04a7f29")
		 (280 . "#2aa198")
		 (300 . "#288e98cbafe2")
		 (320 . "#27c19460bb87")
		 (340 . "#26f38ff5c72c")
		 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-python-bin nil)
 '(weechat-color-list
	 (quote
		(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
	 ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
	 ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
