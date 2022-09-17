;;; INIT-EGLOT --- Config Eglot -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 16 九月 2022
;;
;;; Commentary:
;;
;; Light weight Lsp
;;; Code:
;;

(elpaca-use-package eglot
  :commands eglot eglot-ensure
  :bind (:map eglot-mode-map
	      ("C-c l r" . eglot-rename)
	      ("C-c l a" . eglot-code-actions)
	      ("C-c l k" . eldoc)
	      ("C-c l f" . eglot-format)
	      ("C-c l t r" . eglot-reconnect)
	      ("C-c l t s" . eglot-shutdown)
	      ("C-c l t S" . eglot-shutdown-all))
  :init
  (setq eglot-sync-connect 1
	eglot-connect-timeout 10
	eglot-autoshutdown t
	eglot-send-changes-idle-time 0.5))

(elpaca-use-package consult-eglot
  :after eglot
  :defer t)

(provide 'init-eglot)

;;; init-eglot.el ends here
