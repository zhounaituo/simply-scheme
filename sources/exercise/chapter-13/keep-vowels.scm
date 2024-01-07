(define (keep-vowels wd)
  (if (empty? wd)
      ""
      (if (member? (first wd) 'aeiou)
          (word (first wd) (keep-vowels (bf wd)))
          (keep-vowels (bf wd)))))
