(define (add-three number)
  (+ number 3))
(define (add-three-to-each sent)
  (every add-three sent))

; use lambda
(define (add-three-to-each sent)
  (every (lambda (number) (+ number 3)) sent))
