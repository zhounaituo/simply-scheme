(define (plural wd)
  (word wd (and (member? (last wd) '(x y))
	       (cond ((vowel? (last (bl wd))) 'es)
		     (else 's)))))
(define (vowel? letter)
  (member? letter '(a e i o u)))
