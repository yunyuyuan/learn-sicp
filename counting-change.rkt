#lang racket

; 假设有5种货币，<1,2,3,4,5>分别代表<1元,5元,10元,25元,50元>
; 可以找零的方案总和 = (不使用货币"n"的方案 + 使用货币"n"的方案)
; 但根据这个说法，好像一行代码都写不出来啊
; 首先肯定是递归，那么我们从公式下手，只考虑第一次计算，假设从50元开始，假设初始金额99
; 1. 不使用货币50元的方案，就是使用<1元,5元,10元,25元>支付99元的所有方案
; 2. 使用货币50元的方案，重点：至少有一张50元。不妨假设第一张就拿的50元，那么所有方案为：使用<1元,5元,10元,25元,50元>支付49元的所有方案

; 从货币"5"开始，即n=5，假设初始金额amount=99
(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  ; 如果金额为0，说明方案成功，返回1代表方案数+1
  (cond ((= amount 0) 1)
        ; 如果金额小于0，或者没有可用的货币，无方案
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))
; 简单地把货币映射为实际值
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)