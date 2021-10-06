;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
;;(setq custom-file "~/.emacs.d/custom-file.el")
;;(load-file custom-file)

;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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

;; Disable useless GUI elements.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; Load theme.
;; (use-package gruvbox-theme
;; :ensure t
;; :config
;; (load-theme 'gruvbox-dark-hard t))

(use-package naysayer-theme
:ensure t
:config
(load-theme 'naysayer t))
(set-face-attribute 'region nil :background "#666")

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(column-number-mode t)

;; Configure fonts.
(defun set-font (family)
  "Sets frame font to font-name."
  (interactive "sFont name: ")
  (add-to-list 'default-frame-alist `(font . ,family))
  (set-face-attribute 'default nil :font family)
  (set-face-attribute 'default t :font family)
  (set-face-attribute 'fixed-pitch nil :font family))
(set-font "monospace:size=14")

;; Ido
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

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

;; Complication weird symbols fix
;; colorize output in compile buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;; Configure hooks.
;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . php-mode))
(add-hook 'php-mode-hook
          (lambda ()
             (require 'ac-php-company)
             (company-mode t)
             (setq c-syntactic-indentation nil)
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq c-basic-indent 4)
             (c-set-offset 'topmost-intro 4)
             (c-set-offset 'cpp-macro -4)
             (add-to-list 'company-backends 'company-ac-php-backend)))

(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\'" . web-mode))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(use-package web-mode
  :custom
  (web-mode-markup-indent-offset 4)
  (web-mode-css-indent-offset 4)
  (web-mode-code-indent-offset 4))

;; Whitespace mode
(defun set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'web-mode 'set-up-whitespace-handling)
(add-hook 'tuareg-mode-hook 'set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'set-up-whitespace-handling)
(add-hook 'c-mode-hook 'set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode 'set-up-whitespace-handling)
(add-hook 'java-mode-hook 'set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'set-up-whitespace-handling)
(add-hook 'python-mode-hook 'set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'set-up-whitespace-handling)
(add-hook 'nasm-mode-hook 'set-up-whitespace-handling)
(add-hook 'go-mode-hook 'set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'set-up-whitespace-handling)

;; Company
(use-package company)
(global-company-mode)
;; Provide instant autocompletion.
(setq company-idle-delay 0.0)

;; Line number
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Multiple cursors
(use-package multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Move Text
(use-package move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; Expand region
(global-set-key (kbd "C-;") 'er/expand-region)

;; Duplicate Line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)

(global-set-key (kbd "C-,") 'duplicate-line)

;; Disable C-x C-b that opens useless Buffer Mode window. Use IBuffer instead.
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Disable C-x C-d.
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'dired)

;; For insanely fast cycling through recent buffers.
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; Fix mouse wheel
(global-set-key (kbd "C-M-(") (kbd "<mouse-4>"))
(global-set-key (kbd "C-M-)") (kbd "<mouse-5>"))

;; Yasnippet
(add-hook 'web-mode-hook 'yas-minor-mode)
(yas-global-mode +1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type (quote relative))
 '(package-selected-packages
   '(yasnippet xml-format xml+ web-mode use-package unfill smex naysayer-theme multiple-cursors move-text magit gruvbox-theme expand-region drupal-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Misc
(global-set-key (kbd "C-c p") 'find-file-at-point)
(global-set-key (kbd "C-c i m") 'imenu)

(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t
              visible-bell (equal system-type 'windows-nt))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Taken from here:
;; http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

;;; Stolen from http://ergoemacs.org/emacs/emacs_unfill-paragraph.html
(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000)) ; 90002000 is just random. you can use `most-positive-fixnum'
    (fill-paragraph nil)))

(global-set-key (kbd "C-c M-p") 'unfill-paragraph)

;; Transparency
(defconst frame-transparency 85)
(defun toggle-transparency ()
  (interactive)
  (let ((frame-alpha (frame-parameter nil 'alpha)))
    (if (or (not frame-alpha)
            (= (cadr frame-alpha) 100))
        (set-frame-parameter nil 'alpha
                             `(,frame-transparency
                               ,frame-transparency))
      (set-frame-parameter nil 'alpha '(100 100)))))

;; A little hack which fixes a problem with meta key in fluxbox under VNC.
(setq x-alt-keysym 'meta)
(setq confirm-kill-emacs 'y-or-n-p)
