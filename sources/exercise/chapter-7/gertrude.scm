(define (gertrude1 wd)
  (se (if (vowel? (first wd)) 'an 'a)
      wd
      'is
      (if (vowel? (first wd)) 'an 'a)
      wd
      'is
      (if (vowel? (first wd)) 'an 'a)
      wd))
(define (gertrude wd)
  (let	((articles (if (vowel? (first wd)) 'an 'a)))
	(se articles wd 'is articles wd 'is articles wd)))
(define (vowel? letter)
  (member? letter '(a e i o u)))
