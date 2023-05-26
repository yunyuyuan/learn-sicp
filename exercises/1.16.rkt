#lang racket

(define (iter-expt b n r)
  (cond ((= n 0) r)
        (else (iter-expt (* b b) (quotient n 2) (cond ((= (remainder n 2) 1) (* b r)) (r))))
        ))

(iter-expt 3 5 1)