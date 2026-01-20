(require 'polymode)

(define-hostmode poly-mjs-hostmode
  :mode 'js-ts-mode)

(define-innermode poly-mjs-html-innermode
  :mode 'html-mode
  :head-matcher "html`"
  :tail-matcher "`"
  :head-mode 'host
  :tail-mode 'host)

(define-innermode poly-mjs-css-innermode
  :mode 'css-ts-mode
  :head-matcher "css`"
  :tail-matcher "`"
  :head-mode 'host
  :tail-mode 'host)

(define-innermode poly-mjs-style-innermode
  :mode 'css-ts-mode
  :head-matcher "<style>"
  :tail-matcher "</style>"
  :head-mode 'host
  :tail-mode 'host)

(define-innermode poly-mjs-script-innermode
  :mode 'js-ts-mode
  :head-matcher "<script"
  :tail-matcher "</script>"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-mjs-mode
  :hostmode 'poly-mjs-hostmode
  :innermodes '(poly-mjs-html-innermode poly-mjs-css-innermode poly-mjs-style-innermode))

(provide 'setup-polymode)
