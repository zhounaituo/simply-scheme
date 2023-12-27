(define (european-time time)
  (if (equal? (last time) 'am)
      (first time)
      (+ (first time) 12)))
(define (american-time time)
  (if (<= time 12)
      (sentence time 'am)
      (sentence (- time 12) 'pm)))

