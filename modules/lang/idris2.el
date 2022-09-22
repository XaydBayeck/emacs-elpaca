;;; IDRIS2 --- Idris2 Lang support -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 21 九月 2022
;;
;;; Commentary:
;;
;; Idris 2 is a purely functional programming language with first class types.
;;
;;; Code:
(elpaca-use-package (idris2-mode :host github :repo "idris-community/idris2-mode")
  :after eglot
  :config
  (add-to-list 'eglot-server-programs '(idris2-mode . ("idris2-lsp" ""))))

(provide 'lang/idris2)

;;; idris2.el ends here
