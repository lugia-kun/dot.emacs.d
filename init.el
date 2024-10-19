
(setq byte-compile-error-on-warn t)

;;; (package-initialize)

(set-language-environment "UTF-8")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle "bind-key")

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/custom")

(when (memq window-system '(mac ns x))
  (progn
    (el-get-bundle "exec-path-from-shell")
    (exec-path-from-shell-initialize)
    ))

(require 'setup-general)
(require 'setup-helm)
;(require 'setup-helm-gtags)
;(require 'setup-ggtags)
(require 'setup-c)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-wl)
(when (executable-find "hg")
  (require 'setup-yatex))
(require 'setup-lsp)
(require 'setup-robe)
(require 'setup-markdown)
;(require 'setup-nyan)
(require 'setup-fonts)
(require 'setup-misc)
(require 'setup-imaxima)
(require 'setup-mozc)

(el-get-bundle "cmake-mode")
(when (executable-find "autoreconf")
  (el-get-bundle "gnuplot-mode"))

(require 'setup-hydra)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f82e136e2a0f01479a0b1a5a874ab33fd8f808fa59a86568215a278d43195425" default))
 '(delete-selection-mode nil)
 '(lsp-clients-clangd-args '("--header-insertion-decorators=0" "--clang-tidy"))
 '(package-selected-packages '(compat bind-key flycheck-clangcheck zygospore company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
