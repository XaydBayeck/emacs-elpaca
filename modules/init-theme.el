;; init-theme.el --- Initialize emacs theme -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Doom theme load
;;

;;; Code:

(elpaca-queue
 (elpaca 'doom-themes
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-nord-aurora t)
  ;(load-theme 'doom-dark+ t)
  
  ;;Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom")
  ;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)))
  ;;(load-theme "doom-nord"))

(provide 'init-theme)

;;; init-theme.el ends here
