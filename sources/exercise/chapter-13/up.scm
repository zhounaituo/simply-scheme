(define (up wd)
  (if (empty? wd)
      '()
      (se (up (bl wd)) wd)))
