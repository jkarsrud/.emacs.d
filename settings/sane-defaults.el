;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

(provide 'sane-defaults)
