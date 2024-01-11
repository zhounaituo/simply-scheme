(define (substring? wd1 wd2)
  (cond ((<= (count wd2) (count wd1)) (equal? wd1 wd2))
        ((equal? wd1 (substring (count wd1) wd2)) #t)
        (else (substring? wd1 (bf wd2)))))
(define (substring num wd)
  (if (<= (count wd) num)
      wd
      (substring num (bl wd))))
