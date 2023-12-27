(define (always-one arg)
  1)
(define (count sent)
  (accumulate + (every always-one sent)))
