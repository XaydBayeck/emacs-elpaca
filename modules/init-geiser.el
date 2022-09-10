;;; init-geiser.el --- Initialize Geiser -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Geiser is a generic Emacs/Scheme interaction mode.
;;

;;; Code:
(elpaca-queue
 (elpaca 'geiser
   (elpaca-use-package geiser-chez
     :ensure t)
   (elpaca-use-package geiser-guile
     :ensure t
     :config
     (when (executable-find "guix")
       (add-to-list 'geiser-guile-load-path
        (expand-file-name "~/.config/guix/current/share/guile/site/3.0"))))))

(elpaca-use-package macrostep-geiser
  :hook (geiser-mode . macrostep-geiser-setup)
  :hook (geiser-repl-mode . macrostep-geiser-setup))

(provide 'init-geiser)

;; init-geiser.el ends here
