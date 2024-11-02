(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)

;; Interface configurations
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(load-theme 'adwaita t) ;; Use 'wombat' for dark, 'adwaita' for light
(set-face-attribute 'default nil :height 160) ;; Text size

;; Backup and autosave directory setup
(let ((backup-dir "~/.emacs.d/aux/"))
  (unless (file-exists-p backup-dir)
    (make-directory backup-dir t))
  (setq lock-file-name-transforms `((".*" ,backup-dir t)))
  (setq auto-save-file-name-transforms `((".*" ,backup-dir t)))
  (setq backup-directory-alist `((".*" . ,backup-dir))))

(display-battery-mode 1)

;; Tab and indentation
(setq-default tab-width 4)
(setq c-basic-offset 4)

(defun lmid () ;; Move cursor to the middle of the current line
  (interactive)
  (let ((line-length (- (line-end-position) (line-beginning-position))))
    (goto-char (+ (line-beginning-position) (/ line-length 2)))))

(custom-set-variables
 '(elcord-editor-icon "emacs_legacy_icon")
 '(elcord-idle-message "Got distracted again...")
 '(elcord-idle-timer 600)
 '(elcord-quiet t)
 '(elcord-refresh-rate 10)
 '(package-selected-packages '(elcord flycheck corfu company)))

;; Set up package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Package configurations
(use-package flycheck
  :ensure t
  :hook ((c-mode . flycheck-mode)
         (c++-mode . flycheck-mode))
  :config
  (setq-default flycheck-gcc-language-standard "c++20"
                flycheck-clang-language-standard "c++20"))

(use-package company
  :ensure t
  :hook ((c-mode . company-mode)
         (c++-mode . company-mode))
  :config
  (setq company-backends '((company-clang company-files company-yasnippet)))
  (setq company-clang-arguments '("-std=c++20")))

;; Enable Discord Rich Presence integration
(use-package elcord
  :ensure t
  :config
  (elcord-mode))
