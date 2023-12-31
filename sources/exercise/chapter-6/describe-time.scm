(define (describe-time num)
  (cond ((> num (* (expt 60 2) 24 30 12 100)) 
	 (se (exact->inexact (/ num (* (expt 60 2) 24 30 12 100))) 'centuries))
	((> num (* (expt 60 2) 24 30 12)) 
	 (se (exact->inexact (/ num  (* (expt 60 2) 24 30 12))) 'years))
	((> num (* (expt 60 2) 24 30))
	 (se (exact->inexact (/ num (* (expt 60 2) 24 30))) 'months))
	((> num (* (expt 60 2) 24))
	 (se (exact->inexact (/ num (* (expt 60 2) 24))) 'days))
	((> num (expt 60 2))
	 (se (exact->inexact (/ num (expt 60 2))) 'hours))
	((> num 60)
	 (se (exact->inexact (/ num 60)) 'minutes))
	(else (se num 'seconds))))
