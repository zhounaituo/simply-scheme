(define (remdup sent)
  (remdup-helper sent '()))
(define (remdup-helper sent1 sent2)
  (if (empty? sent1)
      '()
      (if (member? (first sent1) sent2)
          (remdup-helper (bf sent1) sent2)
          (se (first sent1) (remdup-helper (bf sent1) (se (first sent1) sent2))))))
