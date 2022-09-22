;;; init-elpaca.el --- ELPACA INIT DEMO -*- lexical-binding: t; -*-
;; Bootsrap Elpaca
;;; Commentary:

;; This file boostraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;; (setq debug-on-error t)
;; initiliaze elpaca a package manager
;; some configuration
(add-to-list 'load-path "~/.emacs.d/modules/")

(setq user-full-name "Sid")
(setq user-mail-address "SidBayeck@outlook.com")

(require 'cl-lib)
(require 'init-elpaca)
(require 'init-theme)
(require 'init-company)
(require 'init-corfu)
(require 'init-which-key)
(require 'init-meow)
(require 'init-doom-modeline)
(require 'init-tree-sitter)
(require 'init-geiser)
(require 'init-sly)
(require 'init-org)
(require 'init-snippet)
(require 'init-dashboard)
(require 'init-latex)
(require 'init-markdown)
;(require 'init-lsp-bridge)
(require 'init-eglot)
(require 'init-check)
(require 'init-ui)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-trans)
(require 'init-magit)
(require 'init-roam)
(require 'init-gtd)

;; languages
(require 'lang/rust)
(require 'lang/idris2)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
