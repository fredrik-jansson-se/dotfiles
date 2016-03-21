(require 'package)
(require 'misc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(global-pabbrev-mode t)
 '(column-number-mode t)
 '(scroll-preserve-screen-position)
 '(haskell-process-type (quote stack-ghci))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(truncate-lines t))

(package-initialize)

;;(package-install 'flycheck)

(global-flycheck-mode)


;; match parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

;; Hide menu and toolbar
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)))
      

;; Bind M-f to forward-to-word
(global-set-key (kbd "M-f") 'forward-to-word)

;; Use ibuffer instead of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; No start screen
(setq inhibit-startup-message t)

;; Add HOME/bin to path
(setq exec-path (append exec-path '("~/bin")))

;; Save temp files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Erlang
(setq load-path (cons  "/opt/local/lib/erlang/lib/tools-2.8.2/emacs"
                 load-path))
(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/bin" exec-path))
(require 'erlang-start)

;; Tail-f
(require 'cl)
(when (file-exists-p "/Users/frjansso/dev/confd-6.1/devel_support/lib/emacs/tail-f.el")
  (load-file "/Users/frjansso/dev/confd-6.1/devel_support/lib/emacs/tail-f.el"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Haskell
(eval-after-load "haskell-mode"
  '(progn
    (define-key haskell-mode-map (kbd "C-x C-d") nil)
    (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
    (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
    (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
    (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
    (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
    (define-key haskell-mode-map (kbd "C-c M-.") nil)
    (define-key haskell-mode-map (kbd "C-c C-d") nil)))

;; Fix ctrl-up and ctrl-down
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])

