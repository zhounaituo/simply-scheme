(define (sort2 sent)
  (if (> (first sent) (last sent))
      (se (last sent) (first sent))
      sent))
