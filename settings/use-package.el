(provide 'use-package)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (prog-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package dap-mode
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package solaire-mode
  :ensure t
  :hook (after-change-major-mode . solaire-mode)
  :hook (ediff-prepare-buffer . solaire-mode)
  :hook (minibuffer-setup . solaire-mode))

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode))

(use-package select-themes
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-tokyo-night t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-tokyo-night") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
