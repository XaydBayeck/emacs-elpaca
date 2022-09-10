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
(elpaca-queue (elpaca flycheck
               (global-flycheck-mode))
              (elpaca (flycheck-inline :host github :repo "flycheck/flycheck-inline")
                (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)))

(provide 'init-check)

;;; init-check.el ends here
