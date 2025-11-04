(provide 'package-installs)

;; install use-package
(straight-use-package 'use-package)

;; tools
(use-package multiple-cursors
  :straight t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

(use-package vertico
  ;; https://github.com/minad/vertico
  :straight t
  ;; :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package marginalia
  :straight t

  :bind(:map minibuffer-local-map
	     ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package savehist
  :straight t
  :init
  (savehist-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :straight t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic partial-completion substring))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package consult
  ;; https://github.com/minad/consult
  :straight t
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g r" . consult-grep-match)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
)

(use-package corfu
  :straight t
  ;; https://github.com/minad/corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  :custom
  (corfu-auto t)
  
  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  :init
  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)

  ;; Enable optional extension modes:
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

(use-package emacs
  :custom
  ;; enable context menu
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))
    ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil))

(use-package magit
  :straight t)

(use-package smartparens
  :straight t
  :hook (prog-mode . smartparens-mode))

;; org stuff

(use-package org-roam
  :straight t
  :init (setq org-roam-v2-ack t)
  :custom ((org-roam-directory "~/files/roam"))
	   ;; (org-roam-capture-templates
	    ;; '(("e" "enlaces" plain "%?"
	    ;;    :if-new (file+head "enlaces/${title}.org"
	    ;; 			  "#+title: ${title}\n#+filetags: :enlace:\n")
	    ;;    :inmediate-finish t
	    ;;    :unarrowed t)
	    ;;   ("m" "main" plain "%?"
	    ;;    :if-new (file+head "${slug}.org"
	    ;; 			  "#+title: ${title}\n")
	    ;;    :inmediate-finish t
	    ;;    :unarrowed t
	    ;;    ))))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode)
  :bind (("C-c n g" . org-roam-graph)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer-toggle)))

(use-package org-journal
  :straight t
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir "~/files/roam/journal/")
  (org-journal-date-format "%A, %d %B %Y"))

(use-package ob-mermaid
  :straight t)

(setq ob-mermaid-cli-path "mmdc")

(org-babel-do-load-languages
 'org-babel-load-languages
 
 '((org . t)
   (mermaid . t)
   (latex . t)))

;; minor modes

(use-package markdown-mode
  :straight t)

(use-package go-mode
  :straight t)

(use-package terraform-mode
  :straight t)

(use-package json-mode
  :straight t)

(use-package yaml-mode
  :straight t)

(use-package toml-mode
  :straight t)

(use-package elixir-mode
  :straight t)

(use-package rust-mode
  :straight t)

(use-package dockerfile-mode
  :straight t)

(use-package docker-compose-mode
  :straight t)

(use-package k8s-mode
  :straight t)

(use-package olivetti
  :straight t)

(use-package fountain-mode
  :straight t)

(use-package cue-mode
  :straight t)

;; language specifics

;; elixir
;; from https://blog.digressed.net/2025-09-30-emacs-30-1-elixir.html
(use-package inf-elixir
  :straight t
  :bind (("C-c C-c i i" . 'inf-elixir)
         ("C-c C-c i p" . 'inf-elixir-project)
         ("C-c C-c i l" . 'inf-elixir-send-line)
         ("C-c C-c i r" . 'inf-elixir-send-region)
         ("C-c C-c i b" . 'inf-elixir-send-buffer)
         ("C-c C-c i R" . 'inf-elixir-reload-module)))

(use-package exunit
  :straight t
  :config
  (add-hook 'elixir-mode-hook 'exunit)
  (setq transient-default-level 5))

;; cosmetics

(use-package all-the-icons
  :straight t)

(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode)
  :hook (json-mode . display-line-numbers-mode))

(use-package hl-line-mode
  :hook (prog-mode . hl-line-mode))

(use-package highlight-indent-guides
  :straight t
  :hook (prog-mode . highlight-indent-guides-mode)
  :hook (yaml-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

(use-package solaire-mode
  :straight t
  :hook (after-change-major-mode . solaire-mode)
  :hook (ediff-prepare-buffer . solaire-mode)
  :hook (minibuffer-setup . solaire-mode))

(use-package select-themes
  :straight t)

(use-package doom-themes
  :straight t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-bluloco-dark t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
