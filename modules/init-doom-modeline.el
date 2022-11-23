;;; init-doom-modeline.el --- Initialize Doom modeline -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Initialize Doom modelin
;;

;;; Code:
;; (elpaca-use-package shrink-path
;;   :ensure t
;;   :demand t)
(elpaca-use-package doom-modeline
  :defer t
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq inhibit-compacting-font-caches t
	find-file-visit-truename t))

(provide 'init-doom-modeline)

;;; init-doom-modeline.el ends here
