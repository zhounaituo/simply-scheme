(define (f1 sent1 sent2)
    (sentence (butfirst sent1) (butlast sent2)))
(define (f2 sent1 sent2)
    (sentence (f1 sent1 sent2) (word (first sent1) (last sent2))))
(define (f3 sent1 sent2)
    (sentence sent1 sent1))
(define (f4 sent1 sent2)
    (word (item 2 sent1) (item 2 sent2)))