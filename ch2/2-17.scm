; The problem assumes the list to be nonempty.
(define (last-pair xs)
  (define (remember-last-value v l)
    (if (null? l)
      v
      (remember-last-value (car l) (cdr l))))
  (remember-last-value (car xs) (cdr xs)))

; If the list can be empty...
(define (last-pair-robust xs)
  (define (remember-last-value v l)
    (if (null? l)
      v
      (remember-last-value (car l) (cdr l))))
  (if (null? xs)
    (error "The list `xs` is empty!")
    (remember-last-value (car xs) (cdr xs))))

; Test.
(last-pair (list 23 72 149 34))
