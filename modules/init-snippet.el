;; init-snippet.el --- Install and Config yasnippet -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Snippet!
;;

;;; Code:
(elpaca-use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

(use-feature autoinsert
  :after yasnippet
  :init
  ;; Don't want to be prompted before insertion:
  (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (auto-insert-mode 1)
  (defun autoinsert-yas-expand ()
    "Replace text in yasnippet template."
    (yas-expand-snippet (buffer-string) (point-min) (point-max)))
 :config
 (define-auto-insert "\\.el?$" ["default-lisp.el" autoinsert-yas-expand]))

(elpaca-use-package yasnippet-snippets
  :after yasnippet)

(provide 'init-snippet)
;;; init-snippet.el ends here
