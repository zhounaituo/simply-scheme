(define (count arg)
  (if (empty? arg)
      0
      (+ 1 (count (bf arg)))))
