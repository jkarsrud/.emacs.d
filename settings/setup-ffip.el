(require 'find-file-in-project)

(setq ffip-limit 4096)

(defun ffip--create-exclude-find-options (names)
  (mapconcat (lambda (name)
               (concat "-not -regex \".*" name ".*\"")) names " "))


(setq-default ffip-find-options
							(ffip--create-exclude-find-options
							 '(".git/"
								 "node_modules/"
								 "bower_components/"
								 "elpa/"
								 "backups/"
								 "auto-save-list/"
								 "tmp/"
								 "dist/"
								 ".DS_Store")))

(setq-default ffip-filename-rules '(ffip-filename-identity
																		(ffip-filename-dashes-to-camelcase ffip-filename-camelcase-to-dashes)))

(provide 'setup-ffip)
