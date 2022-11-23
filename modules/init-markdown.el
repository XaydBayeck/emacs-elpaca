;;; INIT-MARKDOWN --- Code and Preview Markdown -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created:  9 九月 2022
;;
;;; Commentary:
;;
;; Markdown is a light weight text mark language.
;;
;;; Code:

(elpaca-use-package markdown-mode
  :defer t
  :ensure t
  :mode ("README\\.md'" . gfm-mode)
  :init (setq markdown-command '("pandoc" "--from=markdown" "--to=html5")))

(provide 'init-markdown)

;;; init-markdown.el ends here
