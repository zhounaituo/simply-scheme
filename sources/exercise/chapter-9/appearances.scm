(define (appearances letter wd)
  (count (keep (lambda (x) (equal? x letter)) wd)))
