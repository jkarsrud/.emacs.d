(require 'find-file-in-project)

(setq ffip-limit 4096)

(defun ffip--create-exclude-find-options (names)
  (mapconcat (lambda (name)
               (concat "-not -regex \".*" name ".*\"")) names " "))


(setq-default ffip-find-options
							(ffip--create-exclude-find-options
							 '("/.git/"
								 "/node_modules/"
								 "/bower_components/"
								 "/elpa/"
								 "/backups/"
								 "/auto-save-list/"
								 "/tmp/"
								 "/dist/"
								 ".DS_Store"
								 "/_build/" ;; Phoenix
								 "/coverage/"
								 "/deps/" ;; Hex
								 "/priv/" ;;
								 )))

(setq-default ffip-filename-rules '(ffip-filename-identity
																		(ffip-filename-dashes-to-camelcase ffip-filename-camelcase-to-dashes)))

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(defun jkarsrud-projectile-ignore-dirs (dirs)
	"Add each dir from list DIRS to projectile-globally-ignored-directories"
	(dolist (dir dirs)
		(add-to-list 'projectile-globally-ignored-directories dir)))

(defun jkarsrud-projectile-ignore-files (filenames)
	"Add each file from list FILENAMES to projectile-globally-ignored-directories"
	(dolist (filename filenames)
		(add-to-list 'projectile-globally-ignored-files filename)))

(jkarsrud-projectile-ignore-dirs '(
	 "node_modules"
	 "bower_components"
	 "elpa"
	 "backups"
	 "tmp"
	 "dist"
	 "_build"
	 "coverage"
	 "deps"
	 "priv"
	 "flow-typed"
	 ))

(jkarsrud-projectile-ignore-files '(
																		".DS_Store"
																		))

(provide 'setup-ffip)
