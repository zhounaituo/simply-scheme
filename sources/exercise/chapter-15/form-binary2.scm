(define (form-binary bits)
  (if (empty? bits)
      0
      (+ (* (form-binary (bl bits)) 2)
         (last bits))))
