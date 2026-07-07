(setq byte-compile-error-on-warn t)
(setq custom-file "~/.emacs.d/custom.el")

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
(require 'setup-lammps)

(use-package cmake-mode)
(use-package gnuplot-mode)

(require 'setup-hydra)

(if (file-exists-p custom-file)
    (load custom-file))
