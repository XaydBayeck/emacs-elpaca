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
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	 ("C-c C-p" . projectile-command-map)))

(provide 'init-projectile)

;;; init-projectile.el ends here
