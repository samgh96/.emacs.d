(provide 'globals)

;; screen cosmetics
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)

(setq auto-mode-alist
      (append
       '(
	 ("\\.ex\\'" . elixir-ts-mode)
	 )
       auto-mode-alist))

;; font
(add-to-list 'default-frame-alist '(font . "IBM Plex Mono 13"))
(set-face-attribute 'default t :font "IBM Plex Mono 13")


;; buffer movement
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;; shrinking
(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-<up>") 'shrink-window)
(global-set-key (kbd "M-s-<down>") 'enlarge-window)
