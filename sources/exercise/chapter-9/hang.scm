(define (hang wd letters)
  (accumulate word (every (lambda (x) (if (member? x letters) x '_ )) wd)))
