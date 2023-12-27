(define (any-numbers? sent)
  (not (empty? (keep number? sent))))
