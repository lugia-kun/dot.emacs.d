
(autoload 'markdown-mode "markdown-mode" nil t)

(setq auto-mode-alist
      (append '(("\\.md$" . markdown-mode))
              auto-mode-alist))

(provide 'setup-markdown)
