(define (arabic wd)
  (if (< (count wd) 2)
      (roman-value wd)
      (+ (word (symbol (first wd) (first (bf wd))) 
               (roman-value (first wd)))
         (arabic (bf wd)))))
(define (roman-value letter)
  (cond ((equal? letter 'i) 1)
        ((equal? letter 'v) 5)
        ((equal? letter 'x) 10)
        ((equal? letter 'l) 50)
        ((equal? letter 'c) 100)
        ((equal? letter 'd) 500)
        ((equal? letter 'm) 1000)
        (else 'hum?)))
(define (symbol left right)
  (if (< (roman-value left) (roman-value right))
      '-
      '+))
