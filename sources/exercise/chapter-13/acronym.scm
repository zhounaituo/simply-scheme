(define (acronym sent)
  (if (empty? sent)
      ""
      (if (real-word? (first sent))
          (word (first (first sent)) (acronym (bf sent)))
          (acronym (bf sent)))))
(define (real-word? wd)
  (not (member? wd '(a an the with of and in for to))))
