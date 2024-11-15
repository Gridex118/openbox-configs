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
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages '(lsp-mode doom-modeline)))

;; Line numbering
(setq-default global-display-line-numbers-mode t)
(setq-default display-line-numbers 'relative)

;; Doom Modeline
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq column-number-mode t)
(put 'erase-buffer 'disabled nil)

;; C mode options
(add-hook 'c-mode-hook
          (lambda()
            (setq c-default-style "stroustrup")
	    (lsp)))

(put 'set-goal-column 'disabled nil)

;; Tree Sitter
(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(c "https://github.com/tree-sitter/tree-sitter-c")))
