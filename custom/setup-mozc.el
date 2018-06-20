
(condition-case nil
    (progn
      (require 'mozc)
      (setq default-input-method "japanese-mozc"))
  (error nil))

(provide 'setup-mozc)
