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
(ido-mode t)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Kolors
(require 'color-theme)
(color-theme-sanityinc-tomorrow-eighties)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language-specific Config/Hooks;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Coq
;; (load-file "/home/mnew/code/coq/ProofGeneral/generic/proof-site.el")

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
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#282a2e")
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((coq-prog-args "-emacs-U" "-R" ".." "Braun"))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#cc6666") (40 . "#de935f") (60 . "#f0c674") (80 . "#b5bd68") (100 . "#8abeb7") (120 . "#81a2be") (140 . "#b294bb") (160 . "#cc6666") (180 . "#de935f") (200 . "#f0c674") (220 . "#b5bd68") (240 . "#8abeb7") (260 . "#81a2be") (280 . "#b294bb") (300 . "#cc6666") (320 . "#de935f") (340 . "#f0c674") (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
