(define (same-arg-twice fn)
  (lambda (arg) (fn arg arg)))
