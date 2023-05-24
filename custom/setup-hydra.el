
(el-get-bundle hydra
  (require 'hydra)

  (defhydra hydra-yank-pop ()
    "yank"
    ("C-y" yank nil)
    ("M-y" yank-pop nil)
    ("y" (yank-pop 1) "next")
    ("Y" (yank-pop -1) "prev")
    ("l" helm-show-kill-ring "list" :color blue))
  (global-set-key (kbd "M-y") #'hydra-yank-pop/yank-pop)
  (global-set-key (kbd "C-y") #'hydra-yank-pop/yank)

  (global-set-key
   (kbd "C-n")
   (defhydra hydra-move
     (:body-pre (forward-line))
     "
       _V_       | _a_ begginning-of-line | _v_ scroll-up
       _p_       | _b_ backward-char      |
       \\^       | _f_ forward-char       |
 _a_ _b_ < _l_ > _f_ _e_ | _e_ move-end-of-line   | _q_ quit
       v       | _p_ previous-line      |
       _n_       | _n_ forward-line       |
       _v_       | _l_ center-top-bottom  | _V_ scroll-down
"
     ("n" forward-line)
     ("p" previous-line)
     ("f" forward-char)
     ("b" backward-char)
     ("a" beginning-of-line)
     ("e" move-end-of-line)
     ("v" scroll-up-command)
     ("V" scroll-down-command)
     ("l" recenter-top-bottom)
     ("q" nil)))

  (defhydra hydra-goto-line (goto-map ""
                                      :pre (linum-mode 1)
                                      :post (linum-mode -1))
    "goto-line"
    ("g" goto-line "go")
    ("m" set-mark-command "mark" :bind nil)
    ("q" nil "quit"))

  (defhydra hydra-increment-number ()
    "inc/dec"
    ("f" increment-number-decimal "+")
    ("+" increment-number-decimal "+")
    ("b" decrement-number-decimal "-")
    ("-" decrement-number-decimal "-"))
  (global-set-key (kbd "C-c +") 'hydra-increment-number/body)
  )

(provide 'setup-hydra)
