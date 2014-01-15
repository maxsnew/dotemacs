;; Initialize cask, then pallet.
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;; Kustom Keybindings
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)

;; Global minor modes
(setq-default indent-tabs-mode nil)
(show-paren-mode +1)
(electric-pair-mode +1)
(ido-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language-specific Config/Hooks;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Coq
(load-file "/home/mnew/code/coq/ProofGeneral/generic/proof-site.el")

;; Lisp hooks
(require 'rainbow-delimiters)
;; TODO: figure out if you can get quack with Cask
;;(require 'quack)
(setq lisp-hook
      (lambda ()
	(paredit-mode +1)
	(electric-indent-mode +1)
	(rainbow-delimiters-mode +1)))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook lisp-hook)
(add-hook 'clojure-mode-hook lisp-hook)
(add-hook 'inferior-lisp-mode-hook lisp-hook)
(add-hook 'geiser-repl-mode-hook lisp-hook)

;; Haskell hooks
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)

;; Elm
;; TODO: unset flycheck when doing elm stuff
(add-to-list 'auto-mode-alist '("\\.elm\\'" . haskell-mode))

;; Custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-prog-args (quote ("-I" "/home/mnew/code/coq/cpdt/src")))
 '(inhibit-startup-screen t)
;; '(quack-default-program "racket")
 '(safe-local-variable-values (quote ((coq-prog-args "-emacs-U" "-R" ".." "Braun")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
