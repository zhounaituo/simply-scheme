(define (addup nums)
  (if (empty? nums)
      0
      (+ (first nums) (addup (bf nums)))))
(define (scrunch-words sent)
  (if (empty? sent)
      ""
      (word (first sent) (scrunch-words (bf sent)))))
