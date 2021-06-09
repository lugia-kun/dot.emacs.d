
(el-get-bundle "inf-ruby")
(el-get-bundle "robe-mode")

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(autoload 'robe-mode "robe" nil t)
(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(setq robe-completing-read-func 'helm-robe-completing-read)

(provide 'setup-robe)
