(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-nerd-commenter yang-mode evil-matchit magit haskell-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; ctrl-u should scroll up
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;;; evil-ex
;;; Map ; to :
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") `evil-repeat-find-char)


(require 'evil-matchit)
(global-evil-matchit-mode 1)

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

;;; YANG
(require 'yang-mode)

(defun my-yang-mode-hook ()
  "Configuration for YANG Mode. Add this to `yang-mode-hook'."
  (progn
    (c-set-style "BSD")
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 2)
    (setq font-lock-maximum-decoration t)
    (font-lock-mode t)))

(add-hook 'yang-mode-hook 'my-yang-mode-hook)

(evilnc-default-hotkeys)

;;; Backup files
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )
