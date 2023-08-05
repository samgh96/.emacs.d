(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/settings/")

(package-initialize)

(setq warning-minimum-level :error) ; disable low-level warnings
(setq backup-directory-alist '((".*" . "~/.trash"))) ; move all backups to one folder

(require 'global-modes)
(require 'use-package)
(require 'binds)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e"
     default))
 '(package-selected-packages
   '(go-mode lsp-go ccls select-themes smartparens multiple-cursors helm
	     all-the-icons dap-mode lsp-ui lsp-mode solaire-mode
	     doom-themes company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
