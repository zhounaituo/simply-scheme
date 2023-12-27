(define (num-divisible-by-4? num)
    (and (number? num) (divisible? num 4)))
(define (divisible? dividend divisor)
    (= (remainder dividend divisor) 0))
