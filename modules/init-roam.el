;;; INIT-ROAM --- Non-hierarchical Notes -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 10 九月 2022
;;
;;; Commentary:
;;
;; Org-roam borrows principles from the Zettelkasten method,
;; providing a solution for non-hierarchical note-taking.
;; It should also work as a plug-and-play solution for anyone already using Org-mode for their personal wiki.
;;
;;; Code:
(elpaca-use-package emacsql :ensure t :defer t)
(elpaca-use-package emacsql-sqlite :ensure t :defer t)
;;(elpaca-use-package magit-section)

(elpaca-use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/roam/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ;; Dailies
	 ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;;(require 'org-roam-protocol)
  )

(elpaca-use-package websocket
  :ensure t
  :defer t)
(elpaca-use-package simple-httpd
  :ensure t
  :defer t)

(elpaca-use-package (org-roam-ui :host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :bind (("C-c C-t r" . org-roam-ui-mode))
  :config
  (setq org-roam-ui-sync-theme t
	org-roam-ui-follow t
	org-roam-ui-update-on-save t
	org-roam-ui-open-on-start t))

(provide 'init-roam)

;;; init-roam.el ends here
