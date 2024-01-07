(define (keep pred? arg)
  (accumulate (if (word? arg) 
		  word
		  sentence)
	      (every (lambda (param) (if (pred? param) param '())) arg)))
