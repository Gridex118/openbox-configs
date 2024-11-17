(setq make-backup-files nil)

;; Add Melpa to, uhh, ELPACA?
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Recentf Mode
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

;; Electric Pair Mode
(electric-pair-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight medium :height 143 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-moonlight))
 '(custom-safe-themes
   '("8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" default))
 '(evil-undo-system 'undo-fu)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter yasnippet-snippets yasnippet all-the-icons auctex corfu undo-fu vertico marginalia doom-themes doom-modeline lsp-mode)))

;; UI, and stuff
(require 'all-the-icons) ; Because, for some reason, these aren't auto loaded
(marginalia-mode)
(vertico-mode)

;; Line numbering
(setq-default global-display-line-numbers-mode t)
(setq-default display-line-numbers 'relative)

;; Doom Modeline
(doom-modeline-mode 1)
(setq column-number-mode t)
(put 'erase-buffer 'disabled nil)

;; Org Mode Settings
(setq org-latex-create-formula-image-program 'dvipng)

;; Programming options
(setq c-default-style "stroustrup")
(setq lsp-enable-on-type-formatting nil)
(put 'set-goal-column 'disabled nil)
(add-hook 'prog-mode-hook
	  (lambda()
	    (tree-sitter-hl-mode 1)
	    (yas-global-mode 1)
	    (yas-reload-all)))
(add-hook 'c-mode-hook
          (lambda()
            (lsp)
	    (corfu-mode 1)))
(add-hook 'c++-mode-hook
	  (lambda()
	    (lsp)
	    (corfu-mode 1)))

;; Tree Sitter
(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.0")
	(c "https://github.com/tree-sitter/tree-sitter-c" "v0.22.0")))
