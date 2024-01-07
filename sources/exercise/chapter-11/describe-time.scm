(define standards '(3153600000 31536000 604800 86400 3600 60 1))
(define units '(century year week day hour minute second))
(define (describe-time time)
  (describe-time-helper time standards units))
; 将时间分配到 standard-time 中。
; (describe-time 61 standard-time describe) -> (0 0 0 0 0 1 1)
; 利用递归，将单位和标准时间一同循环，并利用 let 定义每次循环时的标准时间、单位，以减少代码复杂度。
(define (describe-time-helper time standards-sent units-sent)
  (let ((stand (first standards-sent))
        (unit (first units-sent))
        (transfer-time (quotient time (first standards-sent))))
    (if (<= (count standards-sent) 1)
        (if (= 0 time) '() (plural-units time unit))
        (se (if (= 0 transfer-time) '() (plural-units transfer-time unit))
            (describe-time-helper (- time (* transfer-time stand)) 
                           (bf standards-sent)
                           (bf units-sent))))))
; 单复数单位
; 以'(s x sh ch)结尾的单词，加 -es。
; 以"辅音+y"结尾，变 -y 为 i 加 -es。
; 其他情况直接加 -s。
(define (plural-units num units)
  (se num (if (> num 1)
              (plural units)
              units))) 
(define (plural wd)
  (word (bl wd) (cond ((and (equal? 'y (last wd))
                            (not (vowel? (last (bl wd))))) 'ies)
                      ((member? (last wd) '(s x sh ch)) (word (last wd) 'es))
                      (else (word (last wd) 's)))))
(define (vowel? letter)
  (member? letter 'aeiou))
