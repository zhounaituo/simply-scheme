; card-val
; 返回牌的分值
(define (card-val card)
  (cond ((equal? (butfirst card) 'a) 4)
	((equal? (butfirst card) 'k) 3)
	((equal? (butfirst card) 'q) 2)
	((equal? (butfirst card) 'j) 1)
	(else 0)))
; high-card-points
; 返回一副牌的分值
(define (high-card-points hand)
  (accumulate + (every card-val hand)))
; count-suit
; 统计单个花色在牌中的数量。
(define (count-suit suit hand)
  (count (keep (lambda (card) (member? suit card)) hand)))
; suit-counts
; 统计一副牌的所有花色的数量。
(define (suit-counts hand)
  (every (lambda (suit) (count-suit suit hand)) '(s h c d)))
; suit-dist-points
; 返回某个数量的分配点数
(define (suit-dist-points num)
  (cond ((equal? num 0) 3)
	((equal? num 1) 2)
	((equal? num 2) 1)
	(else 0)))
; hand-dist-points
; 返回一副牌的分配点数
(define (hand-dist-points hand)
  (accumulate + (every suit-dist-points (suit-counts hand))))
; briage-val
; 返回一副牌的总点数。
(define (bridge-val hand)
  (+ (high-card-points hand) (hand-dist-points hand))) 
