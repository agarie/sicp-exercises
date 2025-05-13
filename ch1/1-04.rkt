#lang racket/base

(displayln "Exercise 1-04")
(displayln "Observe that our model of evaluation allows for combinations whose operators are compound expressions.")
(displayln "Use this observation to describe the behavior of the following procedure:")

;; This procedure sums `a` with the absolute value of `b` by selecting the correct
;; operator to apply on it depending on its sign.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Some examples.
(a-plus-abs-b 1 1)
(a-plus-abs-b 1 -1)
