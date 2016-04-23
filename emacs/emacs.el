;; PACKAGE MANAGEMENT ==========================================
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-list '(auto-complete
		     evil
		     neotree
		     idea-darkula-theme
		     web-mode
		     relative-line-numbers
		     ))

(package-initialize) ;; You might already have this line

(unless package-archive-contents
  (package-refresh-contents))

;; install missing package
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; PACKAGE SETTINGS

;; evil
(require 'evil)
(evil-mode 1)

;; auto-complete
(global-auto-complete-mode t)

;; GRAPHICAL SETTINGS
(menu-bar-mode -1)
(tool-bar-mode -1)

;; relative-line-number
(global-relative-line-numbers-mode)

;; EMACS CONFIG
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (idea-darkula)))
 '(custom-safe-themes
   (quote
    ("4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
