(define (keep-three-letter-words sent)
  (if (empty? sent)
      '()
      (if (= (count (first sent)) 3)
          (se (first sent) (keep-three-letter-words (bf sent)))
          (keep-three-letter-words (bf sent)))))
              
