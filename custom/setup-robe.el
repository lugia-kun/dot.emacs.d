
(eval-after-load 'company
  '(push 'company-robe company-backends))

(autoload 'robe-mode "robe" nil t)
(add-hook 'ruby-mode-hook 'robe-mode)

(custom-set-variables
 '(robe-completing-read-func 'helm-robe-completing-read))

(provide 'setup-robe)
