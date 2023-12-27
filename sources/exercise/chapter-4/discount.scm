(define (discount x y)
    (exact->inexact (- x (* x (/ y 100)))))
