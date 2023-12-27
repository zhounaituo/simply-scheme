(define (choices menu)
    (if (null? menu)
        '(())
        (let ((smaller (choices (cdr menu))))
            (reduce append
                (map (lambda (item) (prepend-every item smaller))
                    (car menu))))))
(define (prepend-every item lst)
    (map (lambda (choice) (se item choice)) lst))
