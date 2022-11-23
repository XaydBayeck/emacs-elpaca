;;; RUST --- Ruast ! -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 15 九月 2022
;;
;;; Commentary:
;;
;; Happy in code rust.
;;
;;; Code:

(elpaca-use-package rustic
  :ensure t
  :defer t
  :config
  (push 'rustic-clippy flycheck-checkers))

(provide 'lang/rust)

;;; rust.el ends here
