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

;; (elpaca-use-package
;;     (highlight-indentation :host github :repo "antonj/Highlight-Indentation-for-Emacs")
;;   :init (highlight-indentation-mode)
;;   :config
;;   (set-face-background 'highlight-indentation-face "#e3e3d3")
;;   (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(elpaca-use-package (indent-guide :host github :repo "zk-phi/indent-guide")
  :ensure t
  :init (indent-guide-global-mode)
  :config
  (set-face-foreground 'indent-guide-face "#6688aa")
  (setq indent-guide-char "|"))

(provide 'init-ui)

;;; init-ui.el ends here
