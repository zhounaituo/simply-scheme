(define (roots a b c)
  (se (/ (+ (- b) (sqrt (- (* b b) (* 4 a c))))
	 (* 2 a))
      (/ (- (- b) (sqrt (- (* b b) (* 4 a c))))
	 (* 2 a))))
