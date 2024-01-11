; (palindrome? '(flee to me remote elf)) -> #t
(define (palindrome? sent)
  (palindrome-helper (to-word sent)))
(define (palindrome-helper wd)
  (if (< (count wd) 2)
      #t
      (and (equal? (first wd) (last wd)) (palindrome-helper (bf (bl wd))))))
(define (to-word sent)
  (if (empty? sent)
      ""
      (word (first sent) (to-word (bf sent)))))
