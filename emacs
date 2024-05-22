
(setq inhibit-startup-message t)
(setq visible-bell t)

;; The menu bar and its configurations
(menu-bar-mode 1) ;; This one is very useful to leave on actually
(tool-bar-mode -1) ;; No tool bar
(scroll-bar-mode -1) ;; No scroll bars
(global-display-line-numbers-mode 1) ;; Show line numbers
(column-number-mode 1) ;; Show column numbers as well
(load-theme 'adwaita t) ;; My preffered themes
                       ;; 'wombat' for dark, 'adwaita' for light
(set-face-attribute 'default nil :height 125) ;; Text size
;;(setq make-backup-files nil) ;; Prevent backup file from cluttering
(setq lock-file-name-transforms
      '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs.d/aux/\\1" t)))
(setq auto-save-file-name-transforms
      '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs.d/aux/\\1" t)))
(setq backup-directory-alist
      '((".*" . "~/.emacs.d/aux/")))
(display-battery-mode 1)

;; From how i understand it, these variables are supposed to make tab and indentation be 4 in width?
(setq-default tab-width 4) ; Tab width (duh)
(setq c-basic-offset 4) ; Tab width (but for C?)
(find-file "/home/oskar/doc/how2emacs.txt") 
(switch-to-buffer "*scratch*")

(defun lmid ()
  ;;Move cursor to the middle of the current line 
  (interactive)
  (let ((line-length (- (line-end-position) (line-beginning-position))))
    (goto-char (+ (line-beginning-position) (/ line-length 2)))))
