(exercise "example/ttt")

; 找出所有组合中的字母
; (find-triples '_xo_x_o__)
(define (find-triples position)
  (every (lambda (comb)
         (substitute-triple comb position))
  '(412 236 698 874)))
