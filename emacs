

;; This is my emacs config file

(setq inhibit-startup-message t)
(setq visible-bell t)

;; The menu bar and its configurations
(menu-bar-mode 1) ;; This one is very useful to leave on actually
(tool-bar-mode -1) ;; No tool bar
(scroll-bar-mode -1) ;; No scroll bars
(global-display-line-numbers-mode 1) ;; Show line numbers
(column-number-mode 1) ;; Show column numbers as well
(load-theme 'wombat t) ;; My preffered theme
(set-face-attribute 'default nil :height 200) ;; Text size
(setq make-backup-files nil) ;; Prevent backup file from cluttering
(display-battery-mode 1)

;; From how i understand it, these variables are supposed to make tab and indentation be 4 in width?
(setq-default tab-width 4) ; Tab width (duh)
(setq c-basic-offset 4) ; Tab width (but for C?)
