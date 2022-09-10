;;; custom.el --- Custom configurations -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Custom configurations
;;

;;; Code:
(global-linum-mode 1)
(global-hl-line-mode 1)

;; format elisp
(elpaca-use-package elisp-format
  :init
  (require 'elisp-format))

;; quick open configuration file
(defun open-init-file ()
  "Open Emacs init file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(electric-pair-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(geiser-chez-binary "chez")
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-preview-latex-default-process 'dvisvgm)
 '(package-selected-packages
   '(flycheck markdown-mode auctex dashboard yasnippet sly geiser-chez geiser-guile doom-themes marginalia kind-icon embark-consult))
 '(safe-local-variable-values '((lexicalbinding . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

;;; custom.el ends here
