(require 'cc-mode)
(require 'semantic)

;; Dependent package of function-args, swiper, will be fail to build
;; on macOS because OS-bundled version of makeinfo is too old.
;; Install texinfo with Homebrew or Macports and set PATH of newer
;; version of makeinfo.
(el-get-bundle "function-args")
(require 'function-args)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)
(fa-config-default)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'moo-jump-local)
  (local-set-key "\C-c\C-f" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'setup-cedet)
