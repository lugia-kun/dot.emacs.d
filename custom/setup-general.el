
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

(el-get-bundle "company"
  (progn
    (require 'company)
    (global-company-mode 1)
    (delete 'company-semantic company-backends)))

(el-get-bundle "projectile"
  (progn
    (require 'projectile)
    (projectile-mode)
    (setq projectile-enable-caching t)))

(global-set-key (kbd "RET") 'newline-and-indent)
                                        ; automatically indent when press RET

(el-get-bundle "zygospore"
  (progn
    (require 'zygospore)
    (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)))

(el-get-bundle "ace-window")

(global-set-key (kbd "C-x o") 'ace-window)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(el-get-bundle "multiple-cursors")
(el-get-bundle "phi-search")
(el-get-bundle "phi-search-mc")

(require 'multiple-cursors)
(require 'phi-search)
(require 'phi-search-mc)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(phi-search-mc/setup-keys)
(add-hook 'isearch-mode-hook 'phi-search-from-isearch-mc/setup-keys)

(setq inverse-video t)
(delete-selection-mode t)

(provide 'setup-general)
