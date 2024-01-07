(define (countdown num)
  (if (= 0 num) 
      'blastoff!
      (se num (countdown (- num 1)))))
