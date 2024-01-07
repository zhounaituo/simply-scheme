(define (count-ums sent)
  (count (keep is-um? sent)))
(define (is-um? wd)
  (equal? 'um wd))
