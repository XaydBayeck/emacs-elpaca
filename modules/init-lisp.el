;;; init-lisp.el --- Config lisp -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;
;;

;;; Code:
(elpaca-use-package parinfer-rust-mode
  :when (bound-and-true-p module-file-suffix) 
  :hook ((emacs-lisp-mode
	  clojure-mode
	  scheme-mode
	  lisp-mode
	  ;racket-mode
	  ;hy-mode
	  ) . parinfer-rust-mode) 
  :init (setq parinfer-rust-auto-download t))

(provide 'init-lisp)

;; init-lisp.el ends here
