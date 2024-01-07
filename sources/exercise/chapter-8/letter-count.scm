(define (letter-count letter)
  (accumulate + (every count letter)))
