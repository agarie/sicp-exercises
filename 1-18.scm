(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (very-fast-mult a b)
  (cond ((= b 0) a)
        ((even? b) (very-fast-mult (double a) (halve b)))
        (else (very-fast-mult (+ a a) (- b 1)))))

(* 2 4)
(* 13 13)
(* 42 42)
