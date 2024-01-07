(define (prepend-every pre sent)
  (every (lambda (wd) (word pre wd)) sent))
