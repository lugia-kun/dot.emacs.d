
(defun my-set-font () "Set font"
       (cond ((eql window-system 'w32)
              (progn (set-default-font "Cica 12")))
             ((eql window-system 'ns)
              (progn (set-default-font "Cica 16")
                     (set-fontset-font (frame-parameter nil 'font)
                                       'japanese-jisx0213.2004-1
                                       '("Cica" . "unicode-bmp"))
                     (set-fontset-font (frame-parameter nil 'font)
                                       'katakana-sjis
                                       '("Cica" . "unicode-bmp"))))
             ((eql window-system 'x)
              (progn (set-default-font "Cica 16")))))

(my-set-font)

(provide 'setup-fonts)
