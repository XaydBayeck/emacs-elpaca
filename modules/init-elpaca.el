;;; init-elpaca.el --- Initiliaze elpaca a package manager -*- lexical-binding: t -*-
;;; Commentary:
;; initiliaze elpaca a package manager
;;; Code:
(declare-function elpaca-generate-autoloads "elpaca")
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(when-let ((elpaca-repo (expand-file-name "repos/elpaca/" elpaca-directory))
	   (elpaca-build (expand-file-name "builds/elpaca/" elpaca-directory))
	   (elpaca-target (if (file-exists-p elpaca-build) elpaca-build elpaca-repo))
	   (elpaca-url "https://www.github.com/progfolio/elpaca.git")
	   ((add-to-list 'load-path elpaca-target))
	   ((not (file-exists-p elpaca-repo)))
	   (buffer (get-buffer-create "*elpaca-boostrap*")))
  (condition-case-unless-debug err
      (progn
	(unless (zerop (call-process "git" nil buffer t "clone" elpaca-url elpaca-repo))
	  (error "%s" (list (with-current-buffer buffer (buffer-string)))))
	(byte-recompile-directory elpaca-repo 0 'force)
	(require 'elpaca)
	(elpaca-generate-autoloads "elpaca" elpaca-repo)
	(kill-buffer buffer))
    ((error)
     (delete-directory elpaca-directory 'recursive)
     (with-current-buffer buffer
       (goto-char (point-max))
       (insert (format "\n%S" err))
       (display-buffer buffer)))))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :host github :repo "progfolio/elpaca" :build (:not activate-package)))
              ;; Add pending MELPA packages
(elpaca-queue (elpaca '(melpulls :host github :repo "progfolio/melpulls")
                (add-to-list 'elpaca-menu-functions #'melpulls)))
;; Install a package from a user-provided recipe
(elpaca (yodel :host github :repo "progfolio/yodel"))
;; Install use-package
(elpaca-queue (elpaca 'use-package 
                (require 'use-package)
                ;; A few more useful configurations... 
                (use-package emacs 
                  :init 
                  ;; Add prompt indicator to `completing-read-multiple'. 
                  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma. 
                  (defun crm-indicator (args) 
                    (cons (format "[CRM%s] %s" 
                            (replace-regexp-in-string 
                              "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" "" 
                              crm-separator) 
                            (car args)) 
                          (cdr args))) 
                  (advice-add #'completing-read-multiple :filter-args #'crm-indicator) 
                  ;; Do not allow the cursor in the minibuffer prompt
                  (setq minibuffer-prompt-properties 
                        '(read-only t cursor-intangible t face minibuffer-prompt)) 
                  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode) 

                  ;; Emacs 28: Hide commands in M-x which do not work in the current mode. 
                  ;; Vertico commands are hidden in normal buffers. 
                  ;; (setq read-extended-command-predicate 
                  ;; #'command-completion-default-include-p) 
                  ;; Enable recursive minibuffers 
                  (setq enable-recursive-minibuffers t))))

(defmacro use-feature (name &rest args)
  "Like `use-package' but accounting for asynchronous installation.
NAME and ARGS are in `use-package'."
  (declare (indent defun))
  `(elpaca nil (use-package ,name
                 :ensure nil
                 ,@args)))

(provide 'init-elpaca)
