(define (item n sent)
  (first ((repeated bf (- n 1)) sent)))
