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
 '(evil-undo-system 'undo-fu)
 '(ispell-alternate-dictionary nil)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(org-bullets lsp-ui lsp-haskell haskell-mode tmux-mode lua-mode org-fragtog olivetti magit projectile rainbow-delimiters pdf-tools vterm highlight-defined swiper yasnippet-snippets yasnippet all-the-icons auctex corfu undo-fu vertico marginalia doom-themes doom-modeline lsp-mode)))

;; UI, and stuff
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-city-lights t)
  (doom-themes-org-config))

(require 'all-the-icons) ; Because, for some reason, these aren't auto loaded

(use-package evil
  :ensure t
  :init
  (setq evil-want-integratoin t
	evil-want-keybinding nil)
  :config(evil-mode 1))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(marginalia-mode)
(vertico-mode)
(global-corfu-mode)
(setq corfu-auto t)

;; Line numbering
(setq-default global-display-line-numbers-mode t)
(setq-default display-line-numbers 'relative)

;; Doom Modeline
(doom-modeline-mode 1)
(setq column-number-mode t)

;; Tree Sitter
(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.4")
	(c "https://github.com/tree-sitter/tree-sitter-c" "v0.22.7")
	(bash "https://github.com/tree-sitter/tree-sitter-bash" "v0.23.3")
	(tmux "https://github.com/Freed-Wu/tree-sitter-tmux")))

;; Elisp Mode Settings
(add-hook 'emacs-lisp-mode-hook
	  (lambda()
	    (highlight-defined-mode 1)))

;; Programming options
(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
	(c++-mode . c++-ts-mode)))
(add-hook 'prog-mode-hook
	  (lambda()
	    (projectile-mode)
	    (rainbow-delimiters-mode)
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
	    (setq-local electric-pair-inhibit-predicate
			`(lambda (c)
			   (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))
	    (olivetti-mode)
	    (setq org-latex-create-formula-image-program 'dvipng
		  jit-lock-defer-time 0.2
		  org-startup-indented t
		  org-startup-with-latex-preview t
		  org-latex-src-block-backend 'listing
		  org-latex-listings-options '(("numbers" "left")
					       ("breaklines" "true")
					       ("upquote" "true")
					       ("autogobble" "true")
					       ("showstringspaces" "false")
					       ("basicstyle" "\\ttfamily")))
	    (org-bullets-mode 1)
	    (org-fragtog-mode)
	    (display-line-numbers-mode -1)
	    (org-babel-do-load-languages
	     'org-babel-load-languages '((C . t)
					 (emacs-lisp . t)
					 (lua . t)
					 (shell . t)))))

(remove-hook 'olivetti-mode-hook 'visual-line-mode)
(add-hook 'olivetti-mode-hook
	  (lambda()
	    (setq olivetti-body-width 140)))

;; Terminal Settings
(add-hook 'vterm-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)))

;; Eww Settings
(add-hook 'eww-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)))

;; PDF Settings
(add-hook 'doc-view-mode-hook
	  (lambda()
	    (display-line-numbers-mode -1)))

;; TODO: Combine the 3 previous setting blocks, since they repeat the same thing

;; Disable some disabling
(put 'set-goal-column 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
