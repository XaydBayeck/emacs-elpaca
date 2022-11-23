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
  :ensure t
  :commands eglot eglot-ensure
  :bind (:map eglot-mode-map
	      ("C-c l r" . eglot-rename)
	      ("C-c l a" . eglot-code-actions)
	      ("C-c l k" . eldoc)
	      ("C-c l f" . eglot-format-buffer)
	      ("C-c l t r" . eglot-reconnect)
	      ("C-c l t s" . eglot-shutdown)
	      ("C-c l t S" . eglot-shutdown-all))
  :hook ((haskell-mode . eglot-ensure)
	 (rustic-mode . eglot-ensure)
	 (rust-mode . eglot-ensure)
	 (idris2-mode . eglot-ensure))
  :init
  (setq eglot-sync-connect 1
	eglot-connect-timeout 10
	eglot-autoshutdown t
	eglot-send-changes-idle-time 0.5))

(elpaca-use-package consult-eglot
  :after eglot
  :defer t)

;; (elpaca-use-package eldoc-box
;;   :defer t
;;   :ensure eglot
;;   :hook (eglot-managed-mode . elodc-box-hover-mode))

(provide 'init-eglot)

;;; init-eglot.el ends here
