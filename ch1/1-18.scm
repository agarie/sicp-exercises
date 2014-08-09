(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (very-fast-mult a b k)
  (cond ((= b 1) (+ a k))
        ((even? b) (very-fast-mult (double a) (halve b) k))
        (else (very-fast-mult a (- b 1) (+ k a)))))

(define (* a b) (very-fast-mult a b 0))

(very-fast-mult 2 4 0)
(very-fast-mult 2 3 0)
(very-fast-mult 13 13 0)
(very-fast-mult 42 42 0)
(* 2 4)
(* 123412 18473189)
