; (subsets 'rat) -> (r a t ra rt at rat "")
(define (subsets wd)
  (if (empty? wd)
      '()
      (se (perpend-every (first wd) (subsets (bf wd)))
          (subsets (bf wd)))))
(define (perpend-every letter sent)
  (if (empty? sent)
      '()
      (se (word letter (first sent)) (perpend-every letter (bf sent)))))
