(define (first-last sent)
  (keep (lambda (wd) (equal? (first wd) (last wd))) sent))
