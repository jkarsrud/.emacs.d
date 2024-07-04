(require 'polymode)

(define-hostmode poly-js-html-hostmode :mode 'js-ts-mode)

(define-innermode poly-js-html-innermode
  :mode 'html-mode
  :head-matcher (rx "html" (char "`"))
  :tail-matcher (rx (char "`"))
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-js-html-polymode 
  :hostmode 'poly-js-html-hostmode 
  :innermodes ('poly-js-html-innermode))

(provide 'setup-polymode)
