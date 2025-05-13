#lang racket/base

(displayln "Exercise 1-02")
(displayln "Translate the following expression into prefix form:")

(/ (+ 5 4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
