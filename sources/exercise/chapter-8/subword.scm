(define (subword wd start end)
  ((repeated bf (- start 1)) ((repeated bl (- (count wd) end)) wd)))
