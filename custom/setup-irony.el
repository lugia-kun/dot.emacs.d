
(el-get-bundle 'irony-mode
  (progn
    (require 'irony-cdb-json)
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-backends
          (delete 'company-semantic company-backends))
    (setq company-backends
          (delete 'company-clang company-backends))
    (setq company-backends
          (delete 'company-capf company-backends))
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    ))

(el-get-bundle 'company-irony
  (progn
    (add-to-list 'company-backends 'company-irony)
    (setq irony-lang-compile-option-alist
          '((c-mode . "c")
            (c++-mode . "c++")
            (objc-mode . "objective-c")))
    ; (defun ad-irony--lang-compile-option ()
    ;   (defvar irony-lang-compile-option-alist)
    ;   (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
    ;     (when it (append '("-x") (split-string it "\s")))))
    ; (advice-add 'irony--lang-compile-option :override #'ad-irony--lang-compile-option)))
    ))

(projectile-global-mode)

(provide 'setup-irony)
