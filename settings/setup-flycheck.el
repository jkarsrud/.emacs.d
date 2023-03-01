(require 'flycheck)
(require 'flycheck-pos-tip)
(require 'flycheck-flow)

(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.
This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 0.3 3.0)))

;; (defun jkarsrud/use-eslint-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (expand-file-name "node_modules/.bin/eslint"
;;                                         root))))
;;     (when (file-executable-p eslint)
;;       (setq-local flycheck-javascript-eslint-executable eslint))))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

;; (add-hook 'flycheck-mode-hook 'jkarsrud/use-eslint-from-node-modules)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

;; Remove newline checks, since they would trigger an immediate check
;; when we want the idle-change-delay to be in effect while editing.
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(defun flycheck-handle-idle-change ()
  "Handle an expired idle time since the last change.
This is an overwritten version of the original
flycheck-handle-idle-change, which removes the forced deferred.
Timers should only trigger inbetween commands in a single
threaded system and the forced deferred makes errors never show
up before you execute another command."
  (flycheck-clear-idle-change-timer)
  (flycheck-buffer-automatically 'idle-change))

(flycheck-add-mode 'javascript-eslint 'json-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-eslint 'typescript-mode)
(flycheck-add-mode 'ruby-rubocop 'ruby-mode)

(setq-default flycheck-indication-mode 'left-fringe)
(setq-default flycheck-eslint-args '("--ext" ".ts,.js"))

(provide 'setup-flycheck)
