
(require 'cl)

(defun my-set-font () "Set font"
       (cl-case window-system
         (w32 (set-face-font 'default "Ocami 12")
              (with-eval-after-load "markdown-mode"
                (set-face-font 'markdown-code-face "Ocami 12")))
         (ns (set-face-font 'default "Ocami 16")
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
         (x (set-frame-font "Moralerspace Argon JPDOC 11" nil t)
            (set-fontset-font (frame-parameter nil 'font)
                              '(#xe000 . #xf8ff) "Moralerspace Argon JPDOC 11")
            (set-fontset-font (frame-parameter nil 'font)
                              'japanese-jisx0213.2004-1
                              '("Moralerspace Argon JPDOC" . "unicode-bmp"))
            (set-fontset-font (frame-parameter nil 'font)
                              'katakana-sjis
                              '("Moralerspace Argon JPDOC" . "unicode-bmp"))
            (with-eval-after-load "markdown-mode"
              (set-face-font 'markdown-inline-code-face "Ocami")
              (set-face-font 'markdown-pre-face "Ocami")
              (set-face-font 'markdown-markup-face "Ocami")))
         (pgtk (set-frame-font "Moralerspace Argon JPDOC 11" nil t)
               (set-fontset-font (frame-parameter nil 'font)
                                 '(#xe000 . #xf8ff) "Moralerspace Argon JPDOC 11")
               (set-fontset-font (frame-parameter nil 'font)
                                 'japanese-jisx0213.2004-1
                                 '("Moralerspace Argon JPDOC" . "unicode-bmp"))
               (set-fontset-font (frame-parameter nil 'font)
                                 'katakana-sjis
                                 '("Moralerspace Argon JPDOC" . "unicode-bmp"))
               (with-eval-after-load "markdown-mode"
                 (set-face-font 'markdown-inline-code-face "Moralerspace Argon JPDOC")
                 (set-face-font 'markdown-pre-face "Moralerspace Argon JPDOC")
                 (set-face-font 'markdown-markup-face "Moralerspace Argon JPDOC")))
         ))

(my-set-font)

(provide 'setup-fonts)
