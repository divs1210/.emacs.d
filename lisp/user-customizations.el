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


;; buffer sizes
;; ============
(require-package 'zoom)
(custom-set-variables
 '(zoom-mode t))
(custom-set-variables
 '(zoom-size '(0.618 . 0.618)))


;; markdown
;; ========
(require-package 'markdown-mode)
(add-hook 'markdown-mode-hook
          #'flyspell-mode)
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq markdown-fontify-code-blocks-natively t)))


;; magit
;; =====
(require-package 'magit)


;; projectile
;; ==========
(require-package 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


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
(require-package 'inf-clojure)
(defun figwheel-repl ()
  (interactive)
  (inf-clojure "lein figwheel"))

(add-hook 'clojurescript-mode-hook #'inf-clojure-minor-mode)

;; figwheel repl
;; =============
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
          #'web-mode)
(add-hook 'html-mode-hook
          #'company-mode)


;; Interactive Mode
;; ================
(require-package 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require-package 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require-package 'icomplete)
(icomplete-mode 1)

(require-package 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)


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


;; ASCIIDoc
;; ========
(add-to-list 'auto-mode-alist
             (cons "\\.adoc\\'" 'adoc-mode))


;; Integrated Terminal
;; ===================
(require-package 'shell-pop)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t"))


;; GC Tuning for elisp
;; ===================
(setq gc-cons-threshold 20000000)


;; Clojure linting
;; ===============
(require-package 'flycheck-clj-kondo)
(require 'flycheck-clj-kondo)
(add-hook 'clojure-mode-hook #'flycheck-mode)
(add-hook 'clojurescript-mode-hook #'flycheck-mode)


;; Cljs auto-complete
;; ==================
(add-hook 'clojurescript-mode-hook
          #'company-mode)

(add-hook 'clojure-mode-hook
          #'company-mode)

;; (require-package 'anakondo)
;; ;; Enable anakondo-minor-mode in all Clojure buffers
;; (add-hook 'clojure-mode-hook #'anakondo-minor-mode)
;; ;; Enable anakondo-minor-mode in all ClojureScript buffers
;; (add-hook 'clojurescript-mode-hook #'anakondo-minor-mode)
;; ;; Enable anakondo-minor-mode in all cljc buffers
;; (add-hook 'clojurec-mode-hook #'anakondo-minor-mode)


;; dumb jump-to-source
;; ===================
(require-package 'dumb-jump)


;; re-frame jump to keyword
;; ========================
(require 'cider-util)
(require 'cider-resolve)
(require 'cider-client)
(require 'cider-common)
(require 'cider-find)
(require 'clojure-mode)

(defun re-frame-jump-to-reg ()
  (interactive)
  (let* ((kw (cider-symbol-at-point 'look-back))
         (ns-qualifier (and
                        (string-match "^:+\\(.+\\)/.+$" kw)
                        (match-string 1 kw)))
         (kw-ns (if ns-qualifier
                    (cider-resolve-alias (cider-current-ns) ns-qualifier)
                  (cider-current-ns)))
         (kw-to-find (concat "::" (replace-regexp-in-string "^:+\\(.+/\\)?" "" kw))))

    (when (and ns-qualifier (string= kw-ns (cider-current-ns)))
      (error "Could not resolve alias \"%s\" in %s" ns-qualifier (cider-current-ns)))

    (progn (cider-find-ns "-" kw-ns)
           (search-forward-regexp (concat "reg-[a-zA-Z-]*[ \\\n]+" kw-to-find) nil 'noerror))))

(global-set-key (kbd "C-.") 're-frame-jump-to-reg)


;; scheme ide
;; ==========
(require-package 'geiser)
(setq geiser-active-implementations '(guile gambit chicken))


(provide 'user-customizations)
;;; user-customizations.el ends here
