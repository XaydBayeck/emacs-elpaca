;;; INIT-GTD --- Getting Things Done -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 12 九月 2022
;;
;;; Commentary:
;;
;; Getting Things Done (GTD) is a personal productivity system developed by David Allen and published in a book of the same name.
;; GTD is described as a time management system.
;; Allen states "there is an inverse relationship between things on your mind and those things getting done".

;;
;;; Code:

(use-feature org
  :bind ("C-c c" . org-capture)
  :config
  (setq org-agenda-files '("~/org/gtd/inbox.org"
			   "~/org/gtd/gtd.org"
			   "~/org/gtd/tickler.org"))
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
				 (file+headline "~/org/gtd/inbox.org" "Tasks")
				 "* TODO %i%?")
				("T" "Tickler" entry
				 (file+headline "~/org/gtd/tickler.org" "Tickler")
				 "* %i%?\n %U")))
  (setq org-refile-targets '(("~/org/gtd/gtd.org" . (:maxlevel . 3))
			     ("~/org/gtd/someday.org" . (:level . 1))
			     ("~/org/gtd/tickler.org" . (:maxlevel . 2))))
  
  (defun org-current-is-todo ()
    (string= "TODO" (org-get-todo-state)))
  
  (defun my-org-agenda-skip-all-siblings-but-first ()
    "Skip all TODO list except the first one."
    (let (should-skip-entry)
      (unless (org-current-is-todo)
	(setq should-skip-entry t))
      (save-excursion
	(while (and (not should-skip-entry) (org-goto-sibling t))
	  (when (org-current-is-todo)
	    (setq should-skip-entry t))))
      (when should-skip-entry
	(or (outline-next-heading)
	    (goto-char (point-max))))))
  
  (setq org-agenda-custom-commands '(("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))
				     ("o" "At the office" tags-todo "@office"
					    ((org-agenda-overriding-header "Office")
					     (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first))))))

(provide 'init-gtd)

;;; init-gtd.el ends here
