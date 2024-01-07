(define (location wd sent)
  (location-helper wd sent 1))
(define (location-helper wd sent num)
  (if (empty? sent) 
      #f
      (if (equal? wd (first sent))
          num
          (location-helper wd (bf sent) (+ num 1)))))
