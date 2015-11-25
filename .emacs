;;general settings
(setq inhibit-startup-message t) ;hide statup page
(show-paren-mode t) ;show parenthis
(setq show-paren-style 'parentheses)
(setq frame-title-format "%b %I") ;show filename and size
(fset 'yes-or-no-p 'y-or-n-p) ;Y/N replaces yes/no
(setq auto-save-default nil) ;don't create backupfile
;;melpa package setting
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives 
   '("melpa" . "http://melpa.org/packages/") 
   t)
  (package-initialize))
(setq make-backup-files nil) ;no backup file
;; Show line-number
(global-linum-mode t)


;;web-mode setting
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-css-colorization t) ;CSS colorization
  (setq web-mode-enable-block-face t) ;block background, block face
  (setq web-mode-enable-part-face t) ;part face
  (setq web-mode-enable-comment-keywords t) ;comment keywords
  (setq web-mode-enable-heredoc-fontification t) ;heredoc
  (setq web-mode-enable-current-element-highlight t) ;highlight current HTML element
  (setq web-mode-enable-current-column-highlight t) ;highlight current column
  (setq web-mode-enable-auto-pairing t) ;auto pairing;(put 'upcase-region 'disabled nil)
  ;(set-face-attribute 'web-mode-doctype-face "pink3")
  (set-face-attribute 'web-mode-html-tag-face "floral white")
  ;(setq-default tab-width 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
;(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
(define-key web-mode-map (kbd "C-n") 'web-mode-tag-match);;jshint

;;color-theme
;(require 'color-theme)			
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;( color-theme-gray30)
     ))
(load-theme 'zenburn t);;load zenburn theme

;;javascript setting
;js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("da7fa7211dd96fcf77398451e3f43052558f01b20eb8bee9ac0fd88627e11e22" default)))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-indent-switch-body t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
;;web-beautify
(require 'web-beautify) 
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;;automatically format before saving a file
(eval-after-load 'js
  '(add-hook 'js-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;;neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;projectile
(projectile-global-mode)

;;tern.js
;;(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;;autopair
(autopair-global-mode)

;;yasnippet
(yas-global-mode 1)

;;auto-complete
(ac-config-default)
(ac-set-trigger-key "M-/");(ac-set-trigger-key "M-/")

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;; OPTIONAL
;; there are some great Scala yasnippets, browse through:
;; https://github.com/AndreaCrotti/yasnippet-snippets/tree/master/scala-mode
(add-hook 'scala-mode-hook #'yas-minor-mode)
(put 'dired-find-alternate-file 'disabled nil)
