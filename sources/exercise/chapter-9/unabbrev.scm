(define (unabbrev sent1 sent2)
  (every (lambda (wd) (if (number? wd) (item wd sent2) wd)) sent1))
