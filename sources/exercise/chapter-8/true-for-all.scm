(define (true-for-all? fx sent)
  (equal? (count sent) (count (keep fx sent))))
