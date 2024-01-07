(define (compose fx gx)
  (lambda (arg) (fx (gx arg))))
