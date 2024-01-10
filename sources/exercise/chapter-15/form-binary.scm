(define (form-binary bits)
  (if (empty? bits)
      0
      (+ (* (first bits (expt 2 (count (bf bits)))))
         (from-binary (bf bits)))))
