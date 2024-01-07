(define (same-shape? sent1 sent2)
    (if (and (= (count sent1) (count sent2))
             (or (empty? sent1) (empty? sent2)))
        #t
        (if (= (count (first sent1)) (count (first sent2)))
            (and #t (same-shape? (bf sent1) (bf sent2)))
            #f)))

        
