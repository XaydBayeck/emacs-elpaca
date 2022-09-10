;; init-corfu.el --- Initialize corfu. -* lexical-bindings: t; -*-

;;; Commentary:
;;
;; Config corfu and package related with corfu
;;

;;; Code:
(elpaca-use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  ;; (corfu-quit-on-match 'separator)
  ;; (corfu-preview-current t)
  :bind
  ;(:map corfu-map ("SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))

(elpaca corfu-doc
  (add-hook 'corfu-mode-hook #'corfu-doc-mode)
  (define-key corfu-map (kbd "M-n") #'corfu-doc-scroll-down)
  (define-key corfu-map (kbd "M-p") #'corfu-doc-scroll-up)
  (define-key corfu-map (kbd "M-d") #'corfu-doc-toggle))

(elpaca-use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'init-corfu)

;; init-corfu.el ends here
