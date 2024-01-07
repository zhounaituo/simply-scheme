(define (words wd) 
  (every entire-word wd))
(define (entire-word letter)
  (cond ((equal? letter 'a) 'alphe)
	((equal? letter 'b) 'bravo)
	((equal? letter 'c) 'charlie)))
  	 
