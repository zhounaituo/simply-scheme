(define (buzz num)
    (if (or (divisible? num 7) (member? 7 num))
        'buzz
        num))
(define (divisible? dividend divisor)
    (= 0 (remainder dividend divisor)))
