;;; INIT-UI --- Improve UI Experiment -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 10 九月 2022
;;
;;; Commentary:
;;
;; Enable electric-pair-mode, and Add rainbow delimiters support
;;
;;; Code:

(elpaca-use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)

;;; init-ui.el ends here
