(define (evens sent)
  (if (< (count sent) 2)
      '()
      (se (first (bf sent)) (evens (bf (bf sent))))))
