
(if (not (or (eql window-system 'w32) (eql window-system 'x)))
    nil
    (defun my-set-font () "Set font"
           (set-default-font "Ubuntu Mono 12")
           ;; (set-fontset-font (frame-parameter nil 'font)
           ;;                   'japanese-jisx0208
           ;;                   '("MeiryoKe_Console" . "unicode-bmp")
           ;;                   )
           ;; (set-fontset-font (frame-parameter nil 'font)
           ;;                   'katakana-jisx0201
           ;;                   '("MeiryoKe_Console" . "unicode-bmp")
           ;;                   )
           )
    (my-set-font))

(provide 'setup-fonts)
