(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(autoload 'yang-mode "yang-mode" "Major mode for editing YANG modules." t)
(add-to-list 'load-path "~/.emacs.d/frja")
(add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


