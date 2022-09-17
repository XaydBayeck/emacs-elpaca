;;; INIT-CHECK --- Check Text -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created:  9 九月 2022
;;
;;; Commentary:
;;
;; Check Languages' summaries
;;
;;; Code:
(elpaca-use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(elpaca-use-package (flycheck-inline :host github :repo "flycheck/flycheck-inline")
  :after flycheck
  :hook (flycheck-mode . flycheck-inline-mode))

(provide 'init-check)

;;; init-check.el ends here
