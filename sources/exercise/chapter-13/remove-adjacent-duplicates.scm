(define (remove-adjacent-duplicates sent)
  (if (< (count sent) 2)
      '()
      (if (equal? (first sent) (first (bf sent)))
          (se (first sent) (remove-adjacent-duplicates (bf (bf sent))))
          (se (first sent) (remove-adjacent-duplicates (bf sent))))))
          
