
(defun my-set-font () "Set font"
       (cond ((eql window-system 'w32)
              (set-default-font "Ocami 12"))
             ((eql window-system 'ns)
              (progn
                (set-default-font "Ocami 16")
                (set-fontset-font (frame-parameter nil 'font)
                                  '(#xe000 . #xf8ff) "Ocami")
                (set-fontset-font (frame-parameter nil 'font)
                                  'japanese-jisx0213.2004-1
                                  '("Ocami" . "unicode-bmp"))
                (set-fontset-font (frame-parameter nil 'font)
                                  'katakana-sjis
                                  '("Ocami" . "unicode-bmp"))))
             ((eql window-system 'x)
              (progn
                (set-default-font "Ocami 12")
                (set-fontset-font (frame-parameter nil 'font)
                                  '(#xe000 . #xf8ff) "Ocami")
                (set-fontset-font (frame-parameter nil 'font)
                                  'japanese-jisx0213.2004-1
                                  '("Ocami" . "unicode-bmp"))
                (set-fontset-font (frame-parameter nil 'font)
                                  'katakana-sjis
                                  '("Ocami" . "unicode-bmp"))))
             ))
(my-set-font)

(provide 'setup-fonts)
