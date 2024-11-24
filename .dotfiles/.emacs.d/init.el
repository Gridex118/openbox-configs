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
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight medium :height 143 :width normal))))
 '(isearch ((t (:inherit lazy-highlight :background "CadetBlue1" :slant normal :weight medium :height 143 :width normal :foundry "JB" :family "JetBrains Mono")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-moonlight))
 '(custom-safe-themes
   '("a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" default))
 '(evil-undo-system 'undo-fu)
 '(ispell-alternate-dictionary nil)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(emms vterm evil company highlight-defined org-bullets swiper yasnippet-snippets yasnippet all-the-icons auctex corfu undo-fu vertico marginalia doom-themes doom-modeline lsp-mode)))

;; UI, and stuff
(require 'all-the-icons) ; Because, for some reason, these aren't auto loaded
(evil-mode t) ; All hail the vim keybinds
(company-mode 1)
(add-hook 'company-mode-hook
	  (lambda ()
	    (setq company-idle-delay 0)))
(marginalia-mode)
(vertico-mode)

;; Line numbering
(setq-default global-display-line-numbers-mode t)
(setq-default display-line-numbers 'relative)

;; Doom Modeline
(doom-modeline-mode 1)
(setq column-number-mode t)

;; Tree Sitter
(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.4")
	(c "https://github.com/tree-sitter/tree-sitter-c" "v0.22.7")))

;; Elisp Mode Settings
(add-hook 'emacs-lisp-mode-hook
	  (lambda()
	    (highlight-defined-mode 1)))

;; Programming options
(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
	(c++-mode . c++-ts-mode)))
(add-hook 'vterm-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)
	    (evil-local-mode -1)))
(add-hook 'prog-mode-hook
	  (lambda()
	    (setq lsp-enable-on-type-formatting nil
		  treesit-font-lock-level 4
		  c-ts-mode-indent-style 'k&r
		  c-ts-mode-indent-offset 4)
	    (yas-global-mode 1)
	    (yas-reload-all)
	    (flyspell-mode -1)
	    (auto-fill-mode -1)
	    (corfu-mode 1)))
(add-hook 'c-ts-mode-hook
          (lambda()
	    (lsp)))
(add-hook 'c++-ts-mode-hook
	  (lambda()
	    (lsp)))

;; Text Mode Settings
(add-hook 'text-mode-hook
	  (lambda()
	    (setq fill-column 100)
	    (flyspell-mode)
	    (auto-fill-mode)))

;; Org Mode Settings
(add-hook 'org-mode-hook
	  (lambda()
	    (org-babel-do-load-languages
	     'org-babel-load-languages '((C . t)
					 (emacs-lisp . t)))
	    (setq org-latex-create-formula-image-program 'dvipng
		  jit-lock-defer-time 0.2
		  org-latex-src-block-backend 'listing
		  org-latex-listings-options '(("numbers" "left")
					       ("breaklines" "true")
					       ("upquote" "true")
					       ("autogobble" "true")
					       ("showstringspaces" "false")))
	    (org-bullets-mode 1)))

;; Eww Settings
(add-hook 'eww-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)
	    (evil-local-mode -1)))

;; PDF Settings
(add-hook 'doc-view-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)
	    (evil-local-mode -1)))

;; Disable some disabling
(put 'set-goal-column 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
