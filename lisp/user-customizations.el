;; rebind meta
;; ===========
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)


;; disable toolbar
;; ===============
(tool-bar-mode -1)


;; theme
;; =====
(require-package 'zenburn-theme)
(load-theme 'zenburn t)


;; fullscreen
;; ==========
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


;; golden ratio
;; ============
(require-package 'golden-ratio)
(golden-ratio-mode 1)


;; markdown
;; ========
(require-package 'markdown-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq markdown-fontify-code-blocks-natively t)))


;; magit
;; =====
(require-package 'magit)


;; detect project directories
;; ==========================
(require-package 'projectile)


;; file explorer
;; =============
(require-package 'neotree)
(setq neo-autorefresh nil)
(global-set-key [f2] 'neotree-refresh)
(global-set-key [f3] 'neotree-toggle)

(require-package 'all-the-icons)
;; (all-the-icons-install-fonts)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

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


;; Web Dev
;; =======
(require-package 'web-mode)

(add-hook 'html-mode-hook
          'web-mode)
(add-hook 'html-mode-hook
          'company-mode)
(flycheck-add-mode 'javascript-eslint
                   'web-mode)


;; Interactive Mode
;; ================
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require-package 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'icomplete)
(icomplete-mode 1)


;; Kill Ring Dropdown
;; ==================
(require-package 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


;; Debugger
;; ========
;; (require-package 'sayid)
;; (eval-after-load 'clojure-mode
;;   '(sayid-setup-package))


;; Spaceline
;; =========
(require-package 'spaceline)
(require 'spaceline-config)
(spaceline-emacs-theme)


(provide 'user-customizations)
;;; user-customizations.el ends here
