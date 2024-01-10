; (sort '(i wanna be your man)) -> (be i man wanna your)
(define (sort sent)
  (if (empty? sent)
      '()
      (se (earliest-word sent)
          (sort (remove-once (earliest-word sent) sent)))))
; (earliest-word '(i wanna be your man)) -> be
(define (earliest-word sent)
  (earliest-helper (first sent) (bf sent)))
; (earliest-helper 'i '(wanna be your man)) -> be
(define (earliest-helper so-far rest)
  (cond ((empty? rest) so-far)
        ((before? so-far (first rest))
         (earliest-helper so-far (bf rest)))
        (else (earliest-helper (first rest) (bf rest)))))
; (remove-once 'be '(wanna be your man)) -> (wanna your man)
(define (remove-once wd sent) 
  (cond ((empty? sent) '())
        ((equal? wd (first sent)) (bf sent))
        (else (se (first sent) (remove-once wd (bf sent))))))