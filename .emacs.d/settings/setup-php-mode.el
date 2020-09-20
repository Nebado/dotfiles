(defun add-auto-mode (mode &rest patterns)
  (mapc (lambda (pattern)
          (add-to-list 'auto-mode-alist (cons pattern mode)))
        patterns))

(add-auto-mode 'php-mode
               "*html*" "*twig*" "*tmpl*" "\\.erb" "\\.rhtml$" "\\.ejs$" "\\.hbs$"
               "\\.ctp$" "\\.tpl$" "/\\(views\\|html\\|templates\\)/.*\\.php$")

(provide 'setup-php-mode)
