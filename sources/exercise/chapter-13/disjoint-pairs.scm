(define (disjoint-pairs wd)
  (if (< (count wd) 2)
      wd
      (se (word (first wd) (first (bf wd)))
          (disjoint-pairs (bf (bf wd))))))
