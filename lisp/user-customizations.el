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
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq markdown-fontify-code-blocks-natively t)))


;; magit
(require-package 'magit)


;; file explorer
(require-package 'neotree)
(setq neo-autorefresh nil)
(global-set-key [f2] 'neotree-refresh)
(global-set-key [f3] 'neotree-toggle)
(neotree-show)


;; figwheel easy repl
;; ==================
;; (require-package 'inf-clojure)
;; (defun figwheel-repl ()
;;   (interactive)
;;   (inf-clojure "lein figwheel"))
;;
;; (add-hook 'clojurescript-mode-hook #'inf-clojure-minor-mode)

;; figwheel repl
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
         (figwheel-sidecar.repl-api/start-figwheel!)
         (figwheel-sidecar.repl-api/cljs-repl))")

;; turn off word wrap
(global-linum-mode t)
(set-default 'truncate-lines t)


;; cider killed ended fix
;; ======================
(defun cider--gather-session-params (session)
  "Gather all params for a SESSION."
  (let (params)
    (dolist (repl (cdr session))
      (when (buffer-name repl)
        (setq params (cider--gather-connect-params params repl))))
    (when-let* ((server (cider--session-server session)))
      (setq params (cider--gather-connect-params params server)))
    params))

;; Disable Bell
;; ============
(setq ring-bell-function 'ignore)

(provide 'user-customizations)
;;; user-customizations.el ends here
