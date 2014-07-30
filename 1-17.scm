(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0) 1)
        ((even? b) (+ (double a) (* a (halve b))))
        (else (+ a (* a (- b 1))))))

(fast-mult 2 5)
(fast-mult 13 13)
(fast-mult 37 213142131241)
