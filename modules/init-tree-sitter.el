;;; init-tree-sitter.el --- Initialize Tree Sitter -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Config Tree Sitter for syntax highlight.
;;

;;; Code:
(elpaca-queue (elpaca 'tree-sitter
		(require 'tree-sitter)
		(global-tree-sitter-mode)
		(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
	      (elpaca 'tree-sitter-langs
		(require 'tree-sitter-langs)
		(tree-sitter-load 'elisp "elisp")
		(add-to-list 'tree-sitter-major-mode-language-alist
			     '(emacs-lisp-mode . elisp))
		(add-to-list 'tree-sitter-major-mode-language-alist
			     '(inferior-emacs-lisp-mode . elisp))))

(provide 'init-tree-sitter)

;; init-tree-sitter.el ends here
