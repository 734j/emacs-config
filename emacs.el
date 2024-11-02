(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)

;; The menu bar and its configurations
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(load-theme 'adwaita t) ;; 'wombat' for dark, 'adwaita' for light
(set-face-attribute 'default nil :height 160) ;; Text size

;; Prevent backup file from cluttering
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

(defun lmid () ;;Move cursor to the middle of the current line 
  (interactive)
  (let ((line-length (- (line-end-position) (line-beginning-position))))
    (goto-char (+ (line-beginning-position) (/ line-length 2)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elcord-editor-icon "emacs_legacy_icon")
 '(elcord-idle-message "Got distracted again...")
 '(elcord-idle-timer 600)
 '(elcord-quiet t)
 '(elcord-refresh-rate 10)
 '(package-selected-packages '(elcord flycheck corfu company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package flycheck
  :ensure t
  :hook ((c-mode . flycheck-mode)
         (c++-mode . flycheck-mode))
  :config
  ;; Set the C++ standard for both GCC and Clang
  (setq-default flycheck-gcc-language-standard "c++20"
                flycheck-clang-language-standard "c++20"))


(use-package company
  :ensure t
  :hook ((c-mode . company-mode)
         (c++-mode . company-mode))
  :config
  (setq company-backends '((company-clang company-files company-yasnippet)))
  (setq company-clang-arguments '("-std=c++20")))

(require 'elcord)
(elcord-mode)
