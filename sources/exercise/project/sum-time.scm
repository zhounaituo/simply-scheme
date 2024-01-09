; (sum-time '(2:05:00.70 1:21:29.79)) -> '3:26:30.49
(define (sum-time sent)
; (partition '2:05:00.07)
(define (partition wd)
  (if (empty? wd)
      ""
      (if (member? (first wd) '(:))
          (partition (bf wd))
          (word (first wd) (partition (bf wd))))))
