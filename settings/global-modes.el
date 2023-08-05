(provide 'global-modes)

(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(global-hl-line-mode 1)

(add-hook 'prog-mode #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "IntelOne Mono 13"))
(set-face-attribute 'default t :font "IntelOne Mono 13")
