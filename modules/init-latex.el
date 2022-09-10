;;; INIT-LATEX --- Add latex support -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created:  6 九月 2022
;;
;;; Commentary:
;;
;; Add Latex support for emacs
;;
;;; Code:

(elpaca-use-package auctex
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
      (lambda ()
        (add-to-list
         'TeX-command-list
         '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-Tex nil t))
        (setq TeX-command-default "XeLaTeX"))))
                                           
(elpaca-use-package cdlatex
  :ensure auctex
  :init (require 'cdlatex)
  :hook (LaTeX-mode . turn-on-cdlatex)
  :hook (latex-mode . turn-on-cdlatex))

(provide 'init-latex)

;;; init-latex.el ends here
