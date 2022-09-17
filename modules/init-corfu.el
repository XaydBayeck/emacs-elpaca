;; init-corfu.el --- Initialize corfu. -* lexical-bindings: t; -*-

;;; Commentary:
;;
;; Config corfu and package related with corfu
;;

;;; Code:
(elpaca-use-package corfu
  :defer t
  :custom
  (corfu-separator ?\s)
  ;(corfu-preview-current nil)
  (corfu-auto t)
  (corfu-on-exact-match nil)
  (corfu-quit-no-match 'separator)
  (corfu-preselect-first t)
  (corfu-auto-prefix 2)
  ;(corfu-cycle t)
  :bind
  (:map corfu-map
	      ("SPC" . corfu-insert-separator)
	      ("C-n" . corfu-next)
	      ("C-p" . corfu-previous)
        ("C-c t c" . corfu-auto-switch))
  ;; :hook (scheme-mode . corfu-mode)
  ;;       (geiser-repl-mode . corfu-mode))
  :init 
  (global-corfu-mode)
  (defun corfu-auto-switch ()
    (setq corfu-auto (not corfu-auto))))

(elpaca-use-package corfu-doc
  :after corfu
  :hook (corfu-mode . corfu-doc-mode)
  :bind
  (:map corfu-map
        ("M-n" . corfu-doc-scroll-up)
        ("M-p" . corfu-doc-scroll-down)
        ("M-d" . corfu-doc-toggle)))

(elpaca-use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(elpaca-use-package cape
  :defer t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

;; Enable indentation+completion using TAB key.
;; Completion is often bound to M-TAB.
;(setq tab-always-indent 'complete)

(provide 'init-corfu)

;; init-corfu.el ends here
