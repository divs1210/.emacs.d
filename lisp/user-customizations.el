;; rebind meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)


;; theme
(require-package 'zenburn-theme)
(load-theme 'zenburn t)


;; fullscreen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


(provide 'user-customizations)
;;; user-customizations.el ends here
