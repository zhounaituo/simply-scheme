(define (doubles wd)
  (if (< (count wd) 2)
      "" 
      (if (equal? (first wd) (first (bf wd)))
          (word (first wd) (first (bf wd)) (doubles (bf wd)))
          (doubles (bf wd)))))
