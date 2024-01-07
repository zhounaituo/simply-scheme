(define (ttt position me)
  (ttt-choose (find-triples position) me))
(define (ttt-choose triples me)
  (cond 
    ((already-won? triples me) '(already won game is over!))
    ((tie-game? triples me) '(dagfull!))
    ((i-can-win? triples me)) 
	((opponent-can-win? triples me))
    ((i-can-fork? triples me))
    ((i-can-advance? triples me))
	(else (best-free-square triples))))

; 找出所有组合中的字母
; (find-triples '_xo_x_o__)
(define (find-triples position)
  (every (lambda (comb) 
		 (substitute-triple comb position)) 
  '(123 456 789 147 258 369 159 357)))
; 找出一组位置中的字母
; (substitute-triple '123 '_xo_x_o__)
(define (substitute-triple combination position)
  (accumulate word 
	      (every (lambda (square) 
	                     (substitute-letter square position))
		     combination)))
; 找出单个位置中的字母
; (substitute-letter 5 '_xo_x_o__)
(define (substitute-letter square position)
  (if (equal? '_ (item square position))
      square
      (item square position)))

; 判断在当前棋盘下，我是否有机会赢
; (i-can-win? '("1xo" "4x6" o89 "14o" xx8 o69 "1x9" oxo) 'x)
(define (i-can-win? triples me)
  (choose-win
    (keep (lambda (triple) (my-pair? triple me))
	  triples)))
(define (my-pair? triple me)
  (and (= (appearances me triple) 2)
       (= (appearances (opponent me) triple) 0)))
(define (opponent me)
  (if (equal? 'o me) 'x 'o))
(define (choose-win winning-triples)
  (if (empty? winning-triples)
      #f 
      (keep number? (first winning-triples))))
; 判断是否应该阻止玩家
(define (opponent-can-win? triples me)
  (i-can-win? triples (opponent me)))

; 获取棋盘分叉
; (i-can-fork? '(xo3 "4x6" "78o" x47 ox8 "36o" xxo "3x7") 'x)  
(define (i-can-fork? triples me)
  (first-if-any (pivots triples me)))
; 获取句子第一个单词，如果为空则返回 #f
(define (first-if-any sent)
  (if (empty? sent)
      #f
      (first sent)))
; (pivots '(xo3 "4x6" "78o" x47 ox8 "36o" xxo "3x7") 'x) -> (4 7)
(define (pivots triples me)
  (repeated-numbers (keep (lambda (triple) (my-single? triple me))
                          triples)))
; 获取包含我但是不包含对手的组合
; (my-single? 'xo3 'x) -> #f
(define (my-single? triple me)
  (and (= (appearances me triple) 1)
       (= (appearances (opponent me) triple) 0)))
; 获取句子中所有数字
; (repeated-numbers '("4x6" x47 "3x7")) -> (4 7)
(define (repeated-numbers sent)
  (every first 
         (keep (lambda (wd) (>= (count wd) 2))
               (sort-digits (accumulate word sent)))))
; 获取单词中所有的数字，并以 1-9 的顺序合成句子。
; (sort-digits "4x6x473x7") -> ("" "" 3 44 "" 6 77 "" "")
(define (sort-digits number-word)
  (every (lambda (digit) (extract-digit digit number-word))
         '(1 2 3 4 5 6 7 8 9)))
; 返回某个数字在单词中出现次数组合成的单词。 
; (extract-digit 4 '464737) -> 44
(define (extract-digit desired-digit wd)
  (keep (lambda (wd-digit) (equal? wd-digit desired-digit)) wd))

; 获取对手是否可能分叉
(define (opponent-can-fork? triples me)
  (i-can-fork? triples (opponent me)))

; 寻找最优反制路线
; (i-can-advance? '(xo3 "4x6" "78o" x47 ox8 "36o" xxo "3x7") 'o) -> 7
(define (i-can-advance? triples me)
  (best-move (keep (lambda (triple) (my-single? triple me)) triples)
             triples
             me))
; (best-move '("78o" "36o") '(xo3 "4x6" "78o" x47 ox8 "36o" xxo "3x7") 'o) -> 7
(define (best-move my-triples all-triples me)
  (if (empty? my-triples)
      #f
      (best-square (first my-triples) all-triples me)))
; 对手分叉和我路线中的重叠位置
; (best-square "78o" '(xo3 "4x6" "78o" x47 ox8 "36o" xxo "3x7") 'o) -> 7
(define (best-square my-triples triples me)
  (best-square-helper (pivots triples (opponent me))
                      (keep number? my-triples)))
; 返回两个参数中的重叠数字
; (best-square-helper '(4 7) 78) -> 7 
(define (best-square-helper opponent-pivots pair)
  (if (member? (first pair) opponent-pivots)
      (first pair)
      (last pair)))

; 选择最优的位置。
(define (best-free-square triples)
  (first-choice (accumulate word triples)
                '(5 1 3 7 9 2 4 6 8)))
(define (first-choice possibilities preferences)
  (first (keep (lambda (square) (member? square possibilities))
               preferences)))

; 获胜暂定
; (already-won? (find-triples 'x_oxo_xox) 'x)
(define (already-won? triples me)
  (or (is-won? triples me)
      (is-won? triples (opponent me))))
(define (is-won? triples me)
  (member? 3 (every (lambda (triple) (appearances me triple)) triples)))
  
; 平局结束
(define (tie-game? triples me)
  (not (<= 5 (count (keep number? (accumulate word (keep (lambda (triple) (not (and (member? me triple) (member? (opponent me) triple)))) triples)))))))

