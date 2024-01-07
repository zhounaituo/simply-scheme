(define (differences sent)
  (if (< (count sent) 2)
      '()
      (se (- (first (bf sent)) (first sent)) (differences (bf sent)))))
