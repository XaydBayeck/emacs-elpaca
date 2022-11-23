;;; INIT-TRANS --- Translator -*- lexicalbinding: t; -*-
;;
;; Author Sid <SidBayeck@outlook.com>
;; Copyright @ 2022, Sid, all rights reserved.
;; Created: 10 九月 2022
;;
;;; Commentary:
;;
;; Translate on Emacs using [[translate-shell][https://github.com/soimort/translate-shell]]
;;
;;; Code:

(elpaca-use-package (trans-mode :host github :repo "Imymirror/trans-mode")
  :defer t
  :bind ("C-c t t" . trans-mode)
  :custom
  (trans-target "zh" "first target language is zh")
  (trans-scond-target "en" "if source text language code equals first target, use the second target as an alternative.")
  :config
  (trans-install-target "ja"))

(provide 'init-trans)

;;; init-trans.el ends here
