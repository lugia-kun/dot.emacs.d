(defun neocmakelsp--download-server (_client callback error-callback update?)
  "Install/update CMake language server using `pip

Will invoke CALLBACK or ERROR-CALLBACK based on result.
Will update if UPDATE? is t."
  (lsp-async-start-process
   callback
   error-callback
   "cargo" "install" "neocmakelsp"))

(use-package s)
(use-package f)
(use-package flycheck)
(use-package lsp-mode
  :hook ((after-init . global-company-mode)
         (c-mode . (lsp lsp-completion-mode))
         (c++-mode . (lsp lsp-completion-mode))
         (objc-mode . (lsp lsp-completion-mode))
         (cuda-mode . (lsp lsp-completion-mode))
         (cmake-mode . (lsp lsp-completion-mode))
         (lammps-mode . (lsp lsp-completion-mode))
         (latex-mode .  (lsp lsp-completion-mode))
         (LaTeX-mode . (lsp lsp-completion-mode))
         (japanese-latex-mode . (lsp lsp-completion-mode))
         (japanese-LaTeX-mode . (lsp lsp-completion-mode))
         (yatex-mode .  (lsp lsp-completion-mode))
         (typescript-mode . (lsp lsp-completion-mode))
         (ruby-mode . (lsp lsp-completion-mode)))
  :init
  (setq company-backends
        (delete 'company-semantic company-backends))
  (setq company-backends
        (delete 'company-clang company-backends))
  (setq company-backends
        (delete 'company-lsp company-backends))
  :config
  (add-to-list 'lsp-language-id-configuration '(lammps-mode . "lammps"))
  (add-to-list 'lsp-language-id-configuration '(LaTeX-mode . "latex"))
  (add-to-list 'lsp-language-id-configuration '(japanese-LaTeX-mode . "latex"))
  (add-to-list 'lsp-language-id-configuration '(japanese-latex-mode . "latex"))
  (add-to-list 'lsp-language-id-configuration '(yatex-mode . "latex"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("lmp-lsp"))
                    :activation-fn (lsp-activate-on "lammps")
                    :server-id 'lmp-lsp))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("neocmakelsp" "stdio"))
                    :activation-fn (lsp-activate-on "cmake")
                    :priority -1
                    :server-id 'neocmakelsp
                    :download-server-fn #'neocmakelsp--download-server)))

(load-library "flycheck")

(provide 'setup-lsp)
