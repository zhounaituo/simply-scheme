(define (reverse wd)
  (if (empty? wd)
      ""
      (word (last wd) (reverse (bl wd)))))
