(define (exaggerate sent)
  (if (= 1 (count sent))
      (ex sent)
      (se (ex (first sent)) (exaggerate (bf sent)))))
(define (ex wd)
  (cond ((number? wd) (* 2 wd))
        ((equal? wd 'good) 'great)
        ((equal? wd 'bad) 'terrible)
        (else wd)))
      

