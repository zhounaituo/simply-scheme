(define (member? wl ws)
  (if (empty? ws)
      #f
      (or (equal? wl (first ws)) (member? wl (bf ws)))))
