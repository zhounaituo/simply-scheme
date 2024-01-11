; (subsets 'rat) -> (r a t ra rt at rat "")
(define (subsets wd)
  (if (empty? wd)
      (se "")
      (let ((smaller (subsets (bf wd))))
        (se smaller
            (perpend-every (first wd) smaller)))))
(define (perpend-every letter sent)
  (if (empty? sent)
      '()
      (se (word letter (first sent)) 
          (perpend-every letter (bf sent)))))
      
