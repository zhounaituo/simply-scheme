(define (count-adjacent-duplicates sent)
  (if (< (count sent) 2)
      0
      (if (equal? (first sent) (first (bf sent)))
          (+ 1 (count-adjacent-duplicates (bf sent)))
          (+ 0 (count-adjacent-duplicates (bf sent))))))
