#lang racket

; Exercise 1.13: Prove that Fib(n) is the closest integer to
; φ^n/√5, where φ = (1 + √5)/2. Hint: Let ψ = (1 − √5)/2.
; Use induction and the definition of the Fibonacci numbers
; (see Section 1.2.2) to prove that Fib(n) = (φ^n − ψ^n )/√5

(define a (/ (+ 1 (sqrt 5)) 2))
(define b (/ (- 1 (sqrt 5)) 2))
(define (closest n) (/ (- (expt a n) (expt b n)) (sqrt 5)))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 12)
(closest 12)
