
(use-package s)
(use-package f)
(use-package flycheck)
(use-package lsp-mode
  :hook ((after-init . global-company-mode)
         (c-mode . (lsp lsp-completion-mode))
         (c++-mode . (lsp lsp-completion-mode))
         (objc-mode . (lsp lsp-completion-mode)))
  :init
  (setq company-backends
        (delete 'company-semantic company-backends))
  (setq company-backends
        (delete 'company-clang company-backends))
  (setq company-backends
        (delete 'company-lsp company-backends)))

(projectile-global-mode)
(load-library "flycheck")

(provide 'setup-lsp)
