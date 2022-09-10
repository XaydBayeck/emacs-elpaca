;; init-which-key.el --- Initialize which key mode -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Enable Which Key Mode
;;

;;; Code:

(elpaca-queue (elpaca 'which-key
		(which-key-mode)
		(which-key-setup-minibuffer)))

(provide 'init-which-key)

;;; init-theme.el ends here
