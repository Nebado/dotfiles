;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Provide instant autocompletion.
(setq company-idle-delay 0.0)

;; Disable useless startup messages.
(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-screen t)

;;; Make startup faster
(setq package-enable-at-startup nil
      file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      auto-window-vscroll nil
      package--init-file-ensured t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable useless GUI elements.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; Load theme.
(use-package gruvbox-theme
:ensure t
:config
(load-theme 'gruvbox-dark-hard t))

;; Configure fonts.
(defun set-font (family)
  "Sets frame font to font-name."
  (interactive "sFont name: ")
  (add-to-list 'default-frame-alist `(font . ,family))
  (set-face-attribute 'default nil :font family)
  (set-face-attribute 'default t :font family)
  (set-face-attribute 'fixed-pitch nil :font family))
(set-font "Ubuntu Mono:size=16")

(ido-mode t)
(column-number-mode t)

(setq ring-bell-function 'ignore
      frame-resize-pixelwise t)

(setq create-lockfiles nil
      make-backup-files nil)

(defvar s/indent-offset 2)

;; Make the indentation sane.
(setq default-tab-width s/indent-offset
      tab-width s/indent-offset
      standard-indent s/indent-offset)

(setq-default indent-tabs-mode nil)

;; Git integration for Emacs
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; Compilation window
(setq split-height-threshold 0)
(setq compilation-window-height 10)
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;; Dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;; Configure hooks.
(add-hook
 'c-mode-hook
 (lambda ()
   (c-set-offset 'arglist-cont-nonempty '+)))

;; Make working with tabs a little bit easier.
(global-set-key (kbd "C-x t <right>") 'tab-bar-switch-to-next-tab)
(global-set-key (kbd "C-x t <left>") 'tab-bar-switch-to-prev-tab)

;; Disable C-x C-b that opens useless Buffer Mode window. Use IBuffer instead.
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Disable C-x C-d.
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'dired)

;; For insanely fast cycling through recent buffers.
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; Smex
(global-set-key (kbd "M-x") 'smex)

