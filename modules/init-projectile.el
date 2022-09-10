;;; INIT-PROJECTILE --- Initial Projectile -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 10 九月 2022
;;
;;; Commentary:
;;
;; Manage My Projects in Emacs
;;
;;; Code:

(elpaca-use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (message "init projectile")
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map))
  :bind (:map projectile-command-map
	      ("A" . projectile-add-known-project)))

(provide 'init-projectile)

;;; init-projectile.el ends here
