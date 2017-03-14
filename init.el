(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-matchit magit haskell-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ctrul-u should scroll up
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; evil-ex
;; Map ; to :
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") `evil-repeat-find-char)


(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; Hide menu and toolbar
(menu-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)))

; Set line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

;; Use ibuffer instead of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq frame-background-mode 'light)
