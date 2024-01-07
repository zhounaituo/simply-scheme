(define (add-numbers sent)
  (if (empty? sent)
      0
      (if (number? (first sent))
          (+ (first sent) (add-numbers (bf sent)))
          (add-numbers (bf sent)))))
