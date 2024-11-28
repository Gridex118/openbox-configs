;; Remove useless GUI
(setq-default truncate-lines t)
(setq-default blink-cursor-mode nil)
(setq-default inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(windmove-default-keybindings)

;; Precompute activation actions to speed up startup.
;; This requires the use of ‘package-quickstart-refresh’ every time the
;; activations need to be changed, such as when ‘package-load-list’ is modified.
(setq pacakge-quickstart t)

(setq gc-cons-threshold (* 64 1000 1000)) ; 64MB threshold
(setq read-process-output-max (* 1024 1024)) ; 1MB

;; Because the entire page changing hurts *my* eyes
(setq scroll-conservatively 101)

;; Was missing vim a lot
(setq echo-keystrokes .1)
