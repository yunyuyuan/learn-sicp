#lang racket

; count-change(11, 5)
; count-change(-39, 5) + count-change(11, 4)
; count-change(-14, 4) + count-change(11, 3)
; count-change(1, 3) + count-change(11, 2)
; count-change(-9, 3) + count-change(1, 2) + count-change(6, 2) + count-change(11, 1)
; count-change(-4, 2) + count-change(1, 1) + count-change(1, 2)  + count-change(6, 1) + count-change(10, 1)
; 1 + count-change(-4, 2) + count-change(1, 1) + count-change(5, 1) + count-change(9, 1)
; 1 + 1 + count-change(5, 1) + count-change(9, 1)
; ...9x
; 1 + 1 + 1 + 1