;; Remove useless GUI
(setq-default truncate-lines t)
(setq-default blink-cursor-mode nil)
(setq-default inhibit-startup-screen t)
(setq-default resize-mini-windows t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Precompute activation actions to speed up startup.
;; This requires the use of ‘package-quickstart-refresh’ every time the
;; activations need to be changed, such as when ‘package-load-list’ is modified.
(setq pacakge-quickstart t)

;; Garbage collection stuff. Apparently, speeds up startup
(setq gc-cons-threshold (* 64 1000 1000)) ; 50MB threshold
(setq read-process-output-max (* 1024 1024)) ; 1MB

(setq-default help-at-pt-display-when-idle t)
