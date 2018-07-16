
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
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (progn (require 'setup-helm)
         (require 'setup-helm-gtags)))
(require 'setup-ggtags)
(require 'setup-c)
(require 'setup-cedet)
(require 'setup-editing)

(if (not (eql system-type 'windows-nt))
    (require 'setup-mew))
(when (executable-find "hg")
  (require 'setup-yatex))
(require 'setup-irony)
(require 'setup-robe)
(require 'setup-markdown)
(require 'setup-nyan)
(require 'setup-fonts)
(require 'setup-misc)
(require 'setup-imaxima)
(require 'setup-mozc)

(el-get-bundle "cmake-mode")
(when (executable-find "autoreconf")
  (el-get-bundle "gnuplot-mode"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (irony robe zygospore company clean-aindent-mode bind-key)))
 '(robe-completing-read-func (quote helm-robe-completing-read)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
