(define (thismany num wd)
  (se num (if (> num 1) 
	      (word wd 's) 
	      wd)))
