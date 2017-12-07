;; Sample .dir-locals.el

((nil . ((eval . (set (make-local-variable 'my-project-path)
                      (expand-file-name
                       (locate-dominating-file default-directory
                                               ".dir-locals.el"))))))
 (c-mode . ((eval . (setq company-clang-arguments
                          (cons
                           (concat "-I" my-project-path)
                           (concat "-I" my-project-path "build")
                           nil)))
            (c-basic-offset . 2)
            (indent-tabs-mode . nil)))
 (nil . ((c-file-style . "linux"))))
