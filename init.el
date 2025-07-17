(setq byte-compile-error-on-warn t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(set-language-environment "UTF-8")

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d/custom")

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

(require 'setup-general)
(require 'setup-vertico)
(require 'setup-c)
(require 'setup-editing)
(require 'setup-wl)
(require 'setup-yatex)
(require 'setup-lsp)
(require 'setup-markdown)
(require 'setup-nyan)
(require 'setup-fonts)
(require 'setup-misc)
(require 'setup-imaxima)
(require 'setup-mozc)

(use-package cmake-mode)
(use-package gnuplot-mode)

(require 'setup-hydra)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f82e136e2a0f01479a0b1a5a874ab33fd8f808fa59a86568215a278d43195425"
     default))
 '(delete-selection-mode nil)
 '(lsp-clients-clangd-args '("--header-insertion-decorators=0" "--clang-tidy"))
 '(native-comp-async-jobs-number 0)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
