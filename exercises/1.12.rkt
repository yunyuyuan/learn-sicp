#lang racket

; Exercise 1.12: The following pattern of numbers is called Pascal’s triangle.
;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1
;   . . .
; The numbers at the edge of the triangle are all 1, and each
; number inside the triangle is the sum of the two numbers
; above it. Write a procedure that computes elements of
; Pascal’s triangle by means of a recursive process.

(define (pascal row col)
  (cond ((and (= row 0) (= col 0)) 1)
        ((> col row) "invalid")
        ((or (= col 0) (= col row)) 1)
        (else
         (define above_row (- row 1))
         (define left (pascal above_row (- col 1)))
         (define right (pascal above_row col))
         (+ left right)))
  )

(pascal 12 5)