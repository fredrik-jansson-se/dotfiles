(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/frja")
(require 'cl)
(autoload 'yang-mode "yang-mode" "Major mode for editing YANG modules." t)
(add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))
(defun my-yang-mode-hook ()
  "Configuration for YANG Mode. Add this to `yang-mode-hook'."
  (if window-system
    (progn
	     (c-set-style "BSD")
	     (setq indent-tabs-mode nil)
	     (setq c-basic-offset 2)
	     (setq font-lock-maximum-decoration t)
	     (font-lock-mode t))))

(add-hook 'yang-mode-hook 'my-yang-mode-hook)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;; Search in other window with C-M-S
(defun isearch-other-window ()
  (interactive)
  (save-selected-window
    (other-window 1)
    (isearch-forward)))

(global-set-key (kbd "C-M-S") 'isearch-other-window)

;;; Org keys
(global-set-key (kbd "\C-ca") 'org-agenda)
(global-set-key (kbd "\C-cb") 'org-iswitchb)
(global-set-key (kbd "\C-cc") 'org-capture)

;;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;;; boron theme
(load-theme 'boron t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" default)))
 '(global-linum-mode t)
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Documents/notes.org")))
 '(org-default-notes-file "~/Documents/notes.org")
 '(tool-bar-mode nil)
 '(truncate-lines t))
 '(scroll-error-top-bottom t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#2a2a28" :foreground "chartreuse1")))))
