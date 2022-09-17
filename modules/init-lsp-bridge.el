;;; INIT-LSP-BRIDGE --- Language Server Protocol -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created:  9 九月 2022
;;
;;; Commentary:
;;
;; Language Server Protocol
;;
;;; Code:

(elpaca-use-package (lsp-bridge :host github :repo "manateelazycat/lsp-bridge")
  :init
  (add-to-list 'load-path "/home/sid/.emacs.d/elpaca/repos/lsp-bridge")
  (global-lsp-bridge-mode)
  :bind (:map lsp-bridge-mode-map
         ("C-x C-l C-d" . lsp-bridge-find-def)
         ("C-x C-l C-i" . lsp-bridge-find-impl)
         ("C-x C-l C-r" . lsp-bridge-rename)
         ("C-x C-l C-r" . lsp-bridge-rename)
         ("M-d" . lsp-bridge-lookup-documentation)
         ("M-j" . lsp-bridge-popup-documentation-scroll-up)
         ("M-k" . lsp-bridge-popup-documentation-scroll-down)
         ("C-j" . acm-doc-scroll-up)
         ("C-k" . acm-doc-scroll-down))
  :config
  (setq lsp-bridge-lookup-doc-tooltip-max-width 300
        lsp-bridge-lookup-doc-tooltip-border-width 2
	lsp-bridge-lookup-doc-tooltip-text-scale 1.0))

(use-feature emacs
  :bind (:map lisp-interaction-mode-map
	      ("C-e" . eval-print-last-sexp)))

(provide 'init-lsp-bridge)

;;; init-lsp-bridge.el ends here
