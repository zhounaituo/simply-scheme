(define (acronym phrase)
  (accumulate word (every first (keep real-word? phrase))))
(define (real-word? phrase)
  (not (member? phrase '(a an the with of and in for to))))
