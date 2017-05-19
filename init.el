;;; Commentary:
;;; My init.el

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :init
  ;;; ctrl-u should scroll up
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (use-package evil-matchit
    :ensure t
    :init
    (global-evil-matchit-mode 1)
    )

  (show-paren-mode t)
  (setq show-paren-delay 0)

  ;;; treat _ as part of word, e.g. when searching with *
  (defalias #'forward-evil-word #'forward-evil-symbol)

  ;;; always use spaces
  (setq-default indent-tabs-mode nil)

  (use-package evil-nerd-commenter
    :ensure t
    :init
    (evilnc-default-hotkeys)
    )


    ;;; evil-ex
    ;;; Map ; to :
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") `evil-repeat-find-char)
  (defun newline-above ()
    (interactive)
    (let ((oldpos (point)))
      (forward-line -1)
      (end-of-line)
      (newline)))
  (define-key evil-normal-state-map (kbd "[ SPC") 'newline-above)
  )


(use-package magit
  :ensure t
  :pin melpa-stable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode flycheck-tip flycheck erlang f haskell-mode magit evil-nerd-commenter evil-matchit evil yang-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Hide menu and toolbar
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)))

;;; Set line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

;;; Use ibuffer instead of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq frame-background-mode 'light)

;;; Backup files
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `((".*" . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-Interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(use-package yang-mode
  :ensure t
  :config
  (defun my-yang-mode-hook ()
    "Configuration for YANG Mode. Add this to `yang-mode-hook'."
    (progn
      (c-set-style "BSD")
      (setq c-basic-offset 2)
      (setq font-lock-maximum-decoration t)
      (font-lock-mode t)))

  (add-hook 'yang-mode-hook 'my-yang-mode-hook)
  )

(use-package haskell-mode
  :ensure f
  :interpreter ("haskell" . haskell-mode))

(use-package lux-mode
  :load-path "~/.emacs.d/lisp"
  :mode "\\.lux\\'"
  :interpreter "lux")

(use-package erlang
  :ensure f
  :pin melpa-stable
  :config
  (add-hook 'erlang-mode-hook
	    (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
  (add-hook 'erlang-mode-hook 'whitespace-mode)
  (use-package flycheck
    :ensure t
    :pin melpa-stable
    :config
    (global-flycheck-mode))
  (use-package flycheck-tip
    :ensure t
    :pin melpa-stable
    :config
    (flycheck-tip-use-timer 'verbose))
  )

(use-package markdown-mode
  :ensure f
  )

;; (require 'whitespace)
(use-package whitespace
  :config
  (setq whitespace-style '(face empty tabs lines-tail trailing))
  )

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Don't wrap
(set-default 'truncate-lines t)
