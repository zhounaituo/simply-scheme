(define (flip fn)
  (lambda (a b) (fn b a)))
