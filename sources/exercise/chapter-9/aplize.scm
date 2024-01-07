(define (aplize fx)
  (lambda (arg) (if (sentence? arg) (every fx arg) (fx arg))))
