(defvar font-height 120 "The default font size")
(defvar small-font nil "Is small font active")
(defvar font "Fira Code")

(defun toggle-font-size ()
  "toggle font size between 12 and 14 pt"
  (interactive)
  (if (bound-and-true-p small-font)
      (setq font-height 140
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

(set-face-attribute 'default nil :font font :height font-height)

(global-set-key (kbd "C-<f11>") 'toggle-font-size)
(global-set-key (kbd "C-S-<f11>") 'toggle-font-size-large)

(provide 'font-setup)
