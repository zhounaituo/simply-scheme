(define (add-numbers sent)
  (accumulate + (keep number? sent)))
