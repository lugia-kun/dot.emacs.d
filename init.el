;;(require 'package)
;;(add-to-list 'package-archives
;;         '("melpa" . "http://melpa.org/packages/") t)
;;(package-initialize)

(if (eql system-type 'darwin)
    (require 'cask)
  (require 'cask "~/.cask/cask.el"))

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(cask-initialize)

;;(package-initialize)
;;
;;(when (not package-archive-contents)
;;    (package-refresh-contents))
;;
;;(unless (package-installed-p 'use-package)
;;  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path
             "c:/CMake/share/cmake-3.5/editors/emacs")

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-mew)
(require 'setup-yatex)
;; (require 'setup-irony)
(require 'setup-robe)
(require 'setup-markdown)
(require 'setup-nyan)
