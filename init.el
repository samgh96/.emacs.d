(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/settings/")

(package-initialize)

(setq warning-minimum-level :error) ; disable low-level warnings
(setq backup-directory-alist '((".*" . "~/.trash"))) ; move all backups to one folder

(require 'use-package)
(require 'global-modes)
(require 'binds)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0"
     "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443"
     "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da"
     "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948"
     "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644"
     "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e"
     default))
 '(package-selected-packages
   '(magit ansible flymake-cursor highlight-indent-guides go-mode lsp-go
	   ccls select-themes smartparens multiple-cursors helm
	   all-the-icons dap-mode lsp-ui lsp-mode solaire-mode
	   doom-themes company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
