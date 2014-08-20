(define (reverse xs)
  (define (rev-internal ys acc)
    (if (null? ys)
      acc
      (rev-internal (cdr ys) (cons (car ys) acc))))
  (rev-internal xs '()))

; It is possible to define `reverse` without an intermediary list (`acc`) by
; appending the lists.

; Test.
(reverse (list 1 4 9 16 25))
