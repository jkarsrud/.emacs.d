;; CUSTOM

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("5d680d57f9707d837de80e263de624aacbacebcab51bcf8f564744f0a82d26f0"
     "01fbe89e3fcdda0cc5ee3c5e9f72a9953d5b7fa0cf620fa9d25e9fa08d462b8d"
     "859763cf81c9daad4014814bf8e6ba50eeda162a4e20373fa4425088fa1175f3"
     "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197"
     "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" default))
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
 '(flycheck-javascript-flow-args nil)
 '(frame-background-mode nil)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(magit-commit-arguments '("--gpg-sign=FC458350C0F8EBCC"))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(add-node-modules-path all-the-icons all-the-icons-completion
                           all-the-icons-dired ample-theme angular-snippets
                           atom-one-dark-theme auto-complete caddyfile-mode
                           catppuccin-theme cider clojure-mode
                           clojure-mode-extra-font-locking coffee-mode
                           color-theme-solarized company company-box company-lsp
                           company-mode csproj-mode css-eldoc cypher-mode dash
                           deadgrep diff-hl diminish dockerfile-mode
                           doom-modeline dotnet dotnet-mode edn eglot ein elcord
                           elisp-slime-nav elixir-mode emmet-mode emojify
                           exec-path-from-shell expand-region
                           fill-column-indicator find-file-in-project
                           fira-code-mode flx flx-ido flycheck
                           flycheck-color-mode-line flycheck-indicator
                           flycheck-joker forge format-sql gist groovy-mode helm
                           helm-projectile helm-rg highlight-escape-sequences
                           htmlize hydra ido-at-point ido-completing-read+
                           ido-mode ido-vertical-mode inflections js2-mode
                           js2-refactor jsdoc json-mode jupyter kaocha-runner
                           less-css-mode lsp-javascript-typescript lsp-mode
                           lsp-tailwindcss lsp-ui magit magit-popup magithub
                           markdown-mode mmm-mode move-text neotree nginx
                           nginx-mode nodejs-repl one-themes paredit perspective
                           polymode prettier-js prodigy projectile
                           rainbow-delimiters restclient ripgrep rjsx-mode
                           simple-httpd smartparens solarized-theme sql-indent
                           string-edit-at-point swiper tide treemacs typescript
                           typescript-mode undo-tree visual-regexp vterm
                           wakatime-mode web-mode wgrep whitespace-cleanup-mode
                           yaml-mode yasnippet-snippets zen-mode zprint-mode))
 '(safe-local-variable-values
   '((eval let ((project-directory (car (dir-locals-find-file default-directory))))
           (setq lsp-clients-typescript-server-args
                 `("--tsserver-path"
                   ,(concat project-directory
                            ".yarn/sdks/typescript/bin/tsserver")
                   "--stdio")))
     (flycheck-disabled-checkers emacs-lisp-checkdoc) (js2-basic-offset . 2)))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f") (40 . "#c9485ddd1797") (60 . "#bf7e73b30bcb")
     (80 . "#b58900") (100 . "#a5a58ee30000") (120 . "#9d9d91910000")
     (140 . "#9595943e0000") (160 . "#8d8d96eb0000") (180 . "#859900")
     (200 . "#67119c4632dd") (220 . "#57d79d9d4c4c") (240 . "#489d9ef365ba")
     (260 . "#3963a04a7f29") (280 . "#2aa198") (300 . "#288e98cbafe2")
     (320 . "#27c19460bb87") (340 . "#26f38ff5c72c") (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((lsp-mode)))
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900"
                 "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682"
                 "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
