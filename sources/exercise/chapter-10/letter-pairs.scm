(define (letter-pairs wd)
  (if (<= (count wd) 1)
      '()
      (se (word (first wd) (first (bf wd))) (letter-pairs (bf wd)))))
