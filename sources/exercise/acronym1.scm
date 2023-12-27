(define (acronym phrase)
    (accumulate word (every first phrase)))
