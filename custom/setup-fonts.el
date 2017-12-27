
(defun my-set-font () "Set font"
       (if (not (or (eql window-system 'w32) (eql window-system 'x)))
           (if (not (eql window-system 'ns))
               ;;               (set-default-font "Source Han Code JP 12"))
               nil
             (set-default-font "Cica 16")
             (set-fontset-font (frame-parameter nil 'font)
                               'japanese-jisx0213.2004-1
                               '("Cica" . "unicode-bmp"))
             (set-fontset-font (frame-parameter nil 'font)
                               'katakana-sjis
                               '("Cica" . "unicode-bmp")))
         (set-default-font "Cica 12")
         ;; (set-fontset-font (frame-parameter nil 'font)
         ;;                   'japanese-jisx0208
         ;;                   '("MeiryoKe_Console" . "unicode-bmp")
         ;;                   )
         ;; (set-fontset-font (frame-parameter nil 'font)
         ;;                   'katakana-jisx0201
         ;;                   '("MeiryoKe_Console" . "unicode-bmp")
         ;;                   )
         ))

(my-set-font)

(provide 'setup-fonts)
