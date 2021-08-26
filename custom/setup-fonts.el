
(require 'cl)

(defun my-set-font () "Set font"
       (cl-case window-system
         ('w32 (set-face-font 'default "Ocami 12")
               (with-eval-after-load "markdown-mode"
                 (set-face-font 'markdown-code-face "Ocami 12")))
         ('ns (set-face-font 'default "Ocami 16")
              (set-fontset-font (frame-parameter nil 'font)
                                '(#xe000 . #xf8ff) "Ocami")
              (set-fontset-font (frame-parameter nil 'font)
                                'japanese-jisx0213.2004-1
                                '("Ocami" . "unicode-bmp"))
              (set-fontset-font (frame-parameter nil 'font)
                                'katakana-sjis
                                '("Ocami" . "unicode-bmp"))
              (with-eval-after-load "markdown-mode"
                (set-face-font 'markdown-code-face "Ocami 16")))
         ('x (set-face-font 'default "Ocami 12")
             (set-fontset-font (frame-parameter nil 'font)
                               '(#xe000 . #xf8ff) "Ocami")
             (set-fontset-font (frame-parameter nil 'font)
                               'japanese-jisx0213.2004-1
                               '("Ocami" . "unicode-bmp"))
             (set-fontset-font (frame-parameter nil 'font)
                               'katakana-sjis
                               '("Ocami" . "unicode-bmp"))
             (with-eval-after-load "markdown-mode"
               (set-face-font 'markdown-code-face "Ocami 12")))
         ))

(my-set-font)

(provide 'setup-fonts)
