;;; bootstrap.el --- bootstrap

;;; Commentary:
;; bootstrap

;;; Code:
(defvar config-no-auto-update t)
(defvar config-load-path (file-name-directory (or load-file-name buffer-file-name)))
(defvar config-org-files '("myinit.org"))

(defun bootstrap-config ()
  "Pull latest config and load org file."
  (unless config-no-auto-update
      (shell-command (concat "cd " config-load-path " && git pull")))
  (dolist (file config-org-files)
    (org-babel-load-file (expand-file-name (concat config-load-path file))))
  )

(bootstrap-config)

(provide 'bootstrap)
;;; bootstrap.el ends here
