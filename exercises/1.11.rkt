#lang racket

; Exercise 1.11: A function f is defined by the rule that
;        | n if n < 3
; f (n) =|
;        | f (n − 1) + 2f (n − 2) + 3f (n − 3) if n ≥ 3
;
; Write a procedure that computes f by means of a recursive
; process. Write a procedure that computes f by means of an
; iterative process.

; 递归，比较简单，n从大到小
(define (recursive n)
  (cond ((< n 3) n)
        (else (+ (recursive (- n 1))
                 (* 2 (recursive (- n 2)))
                 (* 3 (recursive (- n 3)))
                 ))
        ))

; 迭代，n从小到大
(define (iterative max_n)
  (cond ((< max_n 3) max_n)
        ; max_n >= 3，从3开始，其中(iterative 2) (iterative 1) (iterative 0)都能通过一次调用计算出来
        (else (_iterative 3 max_n (iterative 2) (iterative 1) (iterative 0)))
        ))

; f(0) = 0
; f(1) = 1
; f(2) = 2
; f(3) = 3f(0) + 2f(1) + f(2) = (_iterative 3 n f(2) f(1) f(0)) 实现了迭代——结尾是函数自己，且其参数"都是已有常量"
(define (_iterative curr_n max_n n_1 n_2 n_3)
  (define curr_value (+ n_1 (* 2 n_2) (* 3 n_3)))
  (cond ((> curr_n max_n) n_1)
        ; curr_value,n_1,n_2 分别是下一次迭代的 n_1,n_2,n_3
        (else (_iterative (+ curr_n 1) max_n curr_value n_1 n_2))
        ))

(define n 25)
(string-append "recursive: " (number->string (recursive n)))
(string-append "iterative: " (number->string (iterative n)))