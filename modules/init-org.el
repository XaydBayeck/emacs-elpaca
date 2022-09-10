;; init-org.el --- Initialize Org mode -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Org is everything
;;

;;; Code:
(defvar my-org-babel-default-load-languages
  '((emacs-lisp . t)
    (scheme     . t)
    (latex      . t)
    (dot        . t)
    (python     . t)
    (lisp       . t)))

(elpaca-use-package org
;;  :pin melpa
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   my-org-babel-default-load-languages)
  (setq org-export-with-tags nil))

(elpaca-use-package gnuplot
  :init
  (org-babel-do-load-languages
   'org-babel-load-languages
   (cons '(gnuplot . t) my-org-babel-default-load-languages)))

(elpaca-use-package org-contrib)
;;  :pin nongnu)

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	(sequence "WAITING(w@/!)" "SOMEDAY(s)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)")))

;; (require 'org-checklist)

;; pretty
(elpaca-use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  ;;; Titles and Sections
  ;; hide #+TITLE:
  (setq org-hidden-keywords '(title))
  ;; set basic title font
  (set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
  ;; Low levels are unimportant => no scaling
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
  ;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
  ;; Only use the first 4 styles and do not cycle.
  (setq org-cycle-level-faces nil)
  (setq org-n-level-faces 4)
  ;; Document Title, (\huge)
  (set-face-attribute 'org-document-title nil
                      :height 2.074
                      :foreground 'unspecified
                      :inherit 'org-level-8)
  ;;; Basic Setup
  (setq org-superstar-leading-bullet ?\s
	org-superstar-leading-fallback ?\s
	org-hide-leading-stars nil
	org-superstar-todo-bullet-alist
	'(("TODO" . 9744)
	  ("[ ]"  . 9744)
	  ("DONE" . 9745)
	  ("[x]"  . 9745))))

(elpaca-use-package org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :hook (org-agenda-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("⚑" "⬆" "■")))
;; pretty done

;; edit
(elpaca-use-package org-edit-latex)
(elpaca-use-package org-download
  :after org
  :config
  (defun zz/org-download-paste-clipboard (&optional use-default-filename)
    (interactive "P")
    (require 'org-download)
    (let ((file (if (not use-default-filename)
		    (read-string (format "Filename [%s]: "
					 org-download-screenshot-basename)
				 nil nil org-download-screenshot-basename)
		  nil)))
      (org-download-clipboard file)))
  (setq org-download-method 'directory
	org-download-heading-lvl nil
	org-download-timestamp "%Y%m%d-%H%M%S_")
  :bind (:map org-mode-map
	 ("C-M-a C-p" . zz/org-download-paste-clipboard)))
;; edit done

(provide 'init-org)

;; init-org.el ends here
