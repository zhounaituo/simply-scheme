(define (progressive-squares? sent)
  (if (< (count sent) 2)
      #t
      (if (= (expt (first sent) 2) (first (bf sent)))
          (and #t (progressive-squares? (bf sent)))
          #f)))
