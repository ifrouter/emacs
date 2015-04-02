(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))

 ;(set-language-environment 'Chinese-GB)
 (show-paren-mode 1)
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq plugin-dir "~/.emacs_plugins/")
(add-to-list 'load-path plugin-dir t)

;; for emacs 24
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; line number
(load "linum.el")
(setq linum-format "%6d")
(global-linum-mode 1)
(setq column-number-mode t)

;; color theme
(load "monokai-theme")
;(require 'color-theme-tomorrow)
;(color-theme-tomorrow--define-theme night-bright)
;(color-theme-tomorrow--define-theme night-eighties)
;(color-theme-tomorrow--define-theme day)

(setq frame-title-format "emacs@%b")

;; org-mode
(add-to-list 'load-path (concat plugin-dir "org-8.2.6/lisp"))
(add-to-list 'load-path (concat plugin-dir "org-8.2.6/contrib/lisp ")t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; vim
(add-to-list 'load-path  (concat plugin-dir "evil-1.0.8") )
(require 'evil)

;; php
(add-to-list 'load-path  (concat plugin-dir "php-mode-1.5.0") )
(require 'php-mode)

;; tabbar
(add-to-list 'load-path  (concat plugin-dir "tabbar-2.0.1") )
(require 'tabbar)

;; smex
(add-to-list 'load-path  (concat plugin-dir "smex-3.0") )
(require 'smex)
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)

;; auto-complete
(add-to-list 'load-path  (concat plugin-dir "popup-0.5") )
(add-to-list 'load-path  (concat plugin-dir "auto-complete-1.4") )
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'load-path  (concat plugin-dir "auto-complete-1.4/dict") )
(ac-config-default)

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;; yasnippet
(add-to-list 'load-path (concat plugin-dir "yasnippet-0.8.0"))
(require 'yasnippet)
(yas-global-mode t)

;; autopair
(add-to-list 'load-path  (concat plugin-dir "autopair-0.3") )
(require 'autopair)
(autopair-global-mode)

;;auto-complete-clang-async
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
(setq ac-clang-complete-executable "~/.emacs_plugins/clang-complete")
(setq ac-sources '(ac-source-clang-async))
(ac-clang-launch-completion-process)
)
(setq ac-quick-help-delay 0.2)
(define-key ac-mode-map  [(control return)] 'auto-complete)
(defun my-ac-config ()
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t))
(my-ac-config)

;;idle-highlight-mode
(require 'idle-highlight-mode)
(autoload 'idle-highlight-mode "idle-highlight" "highlight the word the point is on" t)
(add-hook 'find-file-hook 'idle-highlight-mode)

(message "hello elisp")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
