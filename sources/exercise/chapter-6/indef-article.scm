(define (indef-article wd)
  (se (if (vowel? (first wd)) 'an 'a) wd))
(define (vowel? letter)
  (member? letter '(a e i o u)))
  
