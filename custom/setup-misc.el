
(defun increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward " -0123456789")
        (when (looking-at "\\( *-?\\)\\(0+[0-9]+\\)")
          (setq field-width (- (match-end 2) (match-beginning 2)))
          (setq answer (+ (string-to-number (match-string 2) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match
           (concat (match-string 1)
                   (format (concat "%0" (int-to-string field-width) "d")
                           answer))))
        (when (looking-at " *\\(-?\\([1-9][0-9]*\\|0\\([^0-9]\\)\\)\\)")
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 1) 10) inc-by))
          (setq postfix (match-string 3))
          (replace-match
           (concat (format (concat "% " (int-to-string field-width) "d")
                           answer)
                   (if postfix postfix ""))))))))

(defun increment-number-hexadecimal (&optional arg)
  "Increment the number forward from point by 'arg' in hexadecimal."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789abcdefABCDEF")
        (when (looking-at "[0-9a-fA-F]+")
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 16) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 16 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "x")
                                 answer)))))))

(defun decrement-number-decimal (&optional arg)
  "Decrement the number forward from point by 'arg'"
  (interactive "p*")
  (increment-number-decimal (* arg -1)))

(defun decrement-number-hexadecimal (&optional arg)
  "Decrement the number forward from point by 'arg' in hexadecimal"
  (interactive "p*")
  (increment-number-hexadecimal (* arg -1)))

(global-set-key (kbd "C-c +") 'increment-number-decimal)
(global-set-key (kbd "C-c -") 'decrement-number-decimal)

(setq-default c-basic-offset 4)

(provide 'setup-misc)

