(define (real-words sent)
  (let ((words '(a the an in of and for to with)))
       (if (empty? sent)
            '()
            (if (member? (first sent) words)
                (real-words (bf sent))
                (se (first sent) (real-words (bf sent)))))))

