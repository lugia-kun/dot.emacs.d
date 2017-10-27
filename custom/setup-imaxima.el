
(add-to-list 'load-path "~/build/maxima-5.40.0/interfaces/emacs/imaxima")

(autoload 'maxima "maxima" "Maxima CAS mode" t nil)

(autoload 'imaxima "imaxima" "Graphical frontend for Maxima CAS" t nil)

(autoload 'imath-mode "imath" "Math text mode" t nil)

(provide 'setup-imaxima)
