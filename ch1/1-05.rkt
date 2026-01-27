#lang racket/base

(displayln "Exercise 1-05")
(displayln "")
(displayln "")

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0 y))

(test 0 (p))
