
(el-get-bundle 'irony)

(require 'irony-cdb-json)

(add-hook 'after-init-hook 'global-company-mode)
;;(add-hook 'company-mode-hook
;;          '(lambda ()
;;             (setq company-backends
;;                   (delete 'company-semantic company-backends))
;;             (setq company-backends
;;                   (delete 'company-clang company-backends))
;;             ))

(eval-after-load 'company-backends 'company-irony)
(projectile-global-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; Add "../build" (relative to the projectile root directory) of Cxx projects
;; as the path where to find "compile_commands.json", then load irony's options.
(defun my-load-irony-options()
  (irony-cdb-json-add-compile-commands-path
   (projectile-project-root)
   (concat (file-name-as-directory "build")
       "compile_commands.json"))
  (irony-cdb-autosetup-compile-options))

(add-hook 'c-mode-hook 'my-load-irony-options)
(add-hook 'c++-mode-hook 'my-load-irony-options)
(add-hook 'objc-mode-hook 'my-load-irony-options)

(provide 'setup-irony)
