(define (substitute wd1 wd2 sent)
  (every (lambda (wd) (if (equal? wd2 wd) wd1 wd)) sent))
