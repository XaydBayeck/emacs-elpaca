;;; INIT-DASHBOARD --- startup screen -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created:  8 九月 2022
;;
;;; Commentary:
;;
;; Startup Screen showing you what's most important.
;;
;;; Code:

(elpaca-use-package
    (dashboard
     :host github
     :repo "emacs-dashboard/emacs-dashboard")
     ;; :files (:defaults "banners"))
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboardf*")))
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda   . 5))))
 
(provide 'init-dashboard)

;;; init-dashboard.el ends here
