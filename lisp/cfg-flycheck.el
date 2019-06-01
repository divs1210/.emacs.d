;; manual dependencies
(add-to-list 'load-path (concat user-emacs-directory "site-lisp/" "flycheck-20150207.329"))

(require-package 'let-alist)
(require-package 'flycheck-clojure)

(require 'flycheck)

;; (eval-after-load 'flycheck '(flycheck-clojure-setup))

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; Clojure Linter
;; ==============
;; (require-package 'flycheck-joker)

;; (defun flycheck-clojure-may-use-cider-checker ()
;;   "Determine whether a cider checker may be used.

;; Checks for `cider-mode', and a current nREPL connection.

;; Standard predicate for cider checkers."
;;   (let ((connection-buffer (cider-current-repl)))
;;     (and (bound-and-true-p cider-mode)
;;          connection-buffer
;;          (buffer-live-p (get-buffer connection-buffer))
;;          (clojure-find-ns))))
