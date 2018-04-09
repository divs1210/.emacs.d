;; rebind meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)


;; disable toolbar
(tool-bar-mode -1)


;; theme
(require-package 'zenburn-theme)
(load-theme 'zenburn t)


;; fullscreen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


;; golden ratio
(require-package 'golden-ratio)
(golden-ratio-mode 1)


;; markdown support
(require-package 'markdown-mode)


;; magit
(require-package 'magit)


;; file explorer
(require-package 'neotree)
(setq neo-autorefresh nil)
(neotree-show)


(provide 'user-customizations)
;;; user-customizations.el ends here
