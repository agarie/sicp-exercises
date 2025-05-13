#lang racket/base

(displayln "Exercise 1-03")
(displayln
 "Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.")

(define (sum_of_squares x y) (+ (* x x) (* y y)))

(define (sum_of_biggest a b c)
  (cond
    [(> a b)
     (if (> b c)
         (sum_of_squares a b)
         (sum_of_squares a c))]
    [(> a c) (sum_of_squares a b)]
    [else (sum_of_squares b c)]))

(displayln "(sum_of_biggest 1 2 3)")
(sum_of_biggest 1 2 3)

(displayln "(sum_of_biggest 11 0 89)")
(sum_of_biggest 11 0 89)

(displayln "(sum_of_biggest 37 37 4081)")
(sum_of_biggest 37 37 4081)
