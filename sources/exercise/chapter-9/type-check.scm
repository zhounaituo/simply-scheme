(define (type-check f pred)
  (lambda (arg) (if (pred arg) (f arg) #f)))
