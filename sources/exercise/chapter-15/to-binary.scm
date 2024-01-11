(define (to-binary num)
  (if (= num 0)
      ""
      (word (to-binary (quotient num 2)) (remainder num 2))))
