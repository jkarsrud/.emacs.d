(defvar-local font-height 120 "The default font size")
(defvar-local small-font nil "Is small font active")
(defvar-local font "Monaspace Argon" "Buffer font")
;; Modeline
(defvar modeline-font-size 140 "Mode line font size")
(defvar mode-font "Departure Mono" "Modeline font")

(defun toggle-font-size ()
  "toggle font size between 12 and 14 pt"
  (interactive)
  (if (bound-and-true-p small-font)
      (setq font-height 150
	    small-font nil)
    (setq font-height 120
	  small-font t))
  (set-face-attribute 'default nil :font font :height font-height))

(defun toggle-font-size-large ()
  "toggle font size between 18 and 20 pt"
  (interactive)
  (if (bound-and-true-p small-font)
      (setq font-height 200
	    small-font nil)
    (setq font-height 180
	  small-font t))
  (set-face-attribute 'default nil :font font :height font-height))

;; Buffer default
(set-face-attribute 'default nil :font font :height font-height)
;; Modeline setup
(set-face-attribute 'mode-line nil :font mode-font :height modeline-font-size)

(global-set-key (kbd "C-<f11>") 'toggle-font-size)
(global-set-key (kbd "C-S-<f11>") 'toggle-font-size-large)

(provide 'font-setup)
