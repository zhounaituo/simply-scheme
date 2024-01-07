1. 数据结构是零散信息聚合在一起的方法。
2. 计算机科学的重要思想之一：将数据从一种形式转换为另一种形式，以便更容易操作。
4. 不是数字开头的单子必须要用双引号。
5. 该程序开发的思考
	1. 思考这个程序的数据结构。
	   ```scheme
	   ; 图形数据，具有更加直观的数据结构。
	   _|x|o 
	   _|x|_ 
	   o|_|_  
	   ```
	   ```scheme
	   ; 单词类型，用于程序交互。
	   _xo_x_o__
	   ```
	   ```scheme
	   ; 句子类型，方便处理数据。
	   ; 三元重叠表示：模糊了组合位置的信息，以强调组合的完成情况。
	   '(1xo 4x6 o89 14o xx8 o69 1x9 oxo)
	   ```
	2. 组装（kludge）用来避免重复代码。
	## Exercises
	10.1. 如果使用已有胜出的棋盘调用 ttt 会出现什么结果？
	```scheme 
	x|_|o
	x|o|_
	x|o|x
	---
	x_oxo_xox
	---
```
```scheme
(ttt 'x_oxo_xox 'x) ; 结构是 2
```
由于 ttt-choice 除 else 的条件都不适用，所以调用了 best-free-square，所以结果是 2.

 编写 already-won? 
 ```scheme
 (define (already_won? triples me)
  (or (is_won? triples me)
      (is_won? triples (opponent me))))
(define (is_won? triples me)
  (member? 3 (every (lambda (triple) (appearances me triple)) triples)))
```

10.2. 如果九个宫格都填满了，继续运行 ttt 会发生什么？
会报错：
```scheme
;Invalid argument to FIRST:  ()
```
编写 tie-game?，在平局情况下返回 #t。
```scheme 
(define (tie-game? triples)
    (not (member? '_ triples)))
```

10.3. 优化 tie-game? 算法。
形成一条直线，需要 3 个方块，也就是双方至少需要下 5 次，才能包含 3 个可能相连的方块。那么，只要找到除双方共同拥有的组合以外，还包含 5 个数字，就表示还没有平局。
```scheme 
(define (tie-game? triples me)
  (not (equal? 5 (count (keep number? (accumulate word (keep (lambda (triple) (not (and (member? me triple) (member? (opponent me) triple)))) triples)))))))
```

10.4. 修改规则
1. 如果通过角落形成 L  来赢得比赛。
```scheme 
(define (find-triples position)
  (every (lambda (comb)
         (substitute-triple comb position))
  '(412 236 698 874)))
```
2. 如果对角线不算胜利。
```scheme 
(define (find-triples position)
  (every (lambda (comb)
         (substitute-triple comb position))
  '(123 456 789 147 258 369)))
```
3. 如果是角落有四个正方形获胜呢。
正方形的策略已经出现了问题。不能简单的通过 find-triples 修改，进行变更。
