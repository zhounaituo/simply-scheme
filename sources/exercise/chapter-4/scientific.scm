(define (scientific x n)
  (* x (expt 10 n)))
(define (sci-coefficient x)
  (if (= 0 (floor (/ x 10)))
	  (floor x)
	  (sci-coefficient (/ x 10))))
(define (sci-exponent x)
  (round (/ (log (/ x (sci-coefficient x)))
	        (log 10))))
