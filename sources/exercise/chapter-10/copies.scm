(define (copies num wd)
  (if (= 0 num)
      '()
      (se wd (copies (- num 1) wd))))
