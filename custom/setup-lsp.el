
(el-get-bundle 's)
(el-get-bundle 'f)

(el-get-bundle 'flycheck)
(el-get-bundle 'lsp-mode
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-backends
          (delete 'company-semantic company-backends))
    (setq company-backends
          (delete 'company-clang company-backends))
    (setq company-backends
          (delete 'company-lsp company-backends))
    (add-hook 'c-mode-hook 'lsp 'lsp-completion-mode)
    (add-hook 'c++-mode-hook 'lsp 'lsp-completion-mode)
    (add-hook 'objc-mode-hook 'lsp 'lsp-completion-mode)
    ))

(projectile-global-mode)

(provide 'setup-lsp)
