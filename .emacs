
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(elpy doom-themes moe-theme neotree material-theme monokai-theme auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)


;; Adds the Melpa archive to the list of available repositories

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initializes the package infrastructure

(package-initialize)

;;(load-theme 'monokai t)
;;(setq doom-theme 'doom-one)
(load-theme 'doom-gruvbox)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))
	    (progn (setq octave-comment-char ?%)
                        (setq comment-start "%% ")
                        (setq comment-add 0))))

(setq TeX-PDF-mode t)

(setq-default TeX-master nil) ; Query for master file.
(setq TeX-view-program-list '(("Xreader" "xreader --page-index=%(outpage) %o")))
(setq TeX-view-program-selection '((output-pdf "Xreader")))
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-start-server t)
(setq-default buffer-file-coding-system 'utf-8-unix)


(setq-default fill-column 100)
(global-linum-mode t)               ;; Enable line numbers globally

(elpy-enable)
(setq elpy-rpc-python-command "python3")

(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'php-mode)
(require 'web-mode)

(require 'neotree)

(global-set-key [f8] 'neotree-toggle)

(set-face-attribute 'default nil :height 80)

(dolist (hook '(text-mode-hook latex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-unset-key (kbd "C-z"))
