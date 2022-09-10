;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:
;(assq-delete-all 'org package--builtins)
;(assq-delete-all 'org package--builtin-versions)


(setq native-comp-async-report-warnings-errors nil)

(setq make-backup-files nil)

;; Debug
;;
;; (unless (string-empty-p file)
;;   (eval-after-load file)
;;   '(debug))
;;
;; (setq debug-on-message "")
;;
;; (add-variable-watcher 'org-capture-after-finalize-hook
;;                       (lambda (symbol newval operation where)
;;                         (debug)
;;                         (message "%s set to %s" symbol newval)))
;; (setq debug-on-error t)

(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(setq gc-cons-threshold most-positive-fixnum)

(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
    5 nil
    (lambda () (unless (frame-focus-state) (arbage-collect)))))

;; UI
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq frame-inhibit-implied-resize t)

;; set default and backup fonts
(push '(font . "Hasklug Nerd Font") default-frame-alist)
(set-face-font 'default "Hasklug Nerd Font")
(set-face-font 'variable-pitch "JetBrainsMono Nerd Font")
(copy-face 'default 'fixed-pitch)

;; ignore X resources.
(advice-add #'x-apply-session-resources :override #'ignore)

;; So we can detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here
