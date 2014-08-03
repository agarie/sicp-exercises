; Prime testing.
(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

; Exercise 1-23 is about using a better find-divisor procedure.
(define (next n)
  (if (= n 2) 3
    (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

; Benchmarking.
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes first last)
  (define (search-iter cur)
    (if (<= cur last) (timed-prime-test cur))
    (if (<= cur last) (search-iter (+ cur 2))))
  (search-iter (if (even? first) (+ first 1) first)))

; Using bigger numbers -- we are in 2014!
(search-for-primes 1000000000 1000000099)
(search-for-primes 10000000000 10000000099)
(search-for-primes 100000000000 100000000099)
(search-for-primes 1000000000000 1000000000099)

; (search-for-primes 1000000000 1000000099)
; 1000000007 *** .04000000000000001
; 1000000009 *** .04999999999999999
; 1000000021 *** .03999999999999998
; 1000000033 *** 4.0000000000000036e-2
; 1000000087 *** .03999999999999998
; 1000000093 *** .04999999999999999
; 1000000097 *** 4.0000000000000036e-2

; (search-for-primes 10000000000 10000000099)
; 10000000019 *** .14
; 10000000033 *** .14
; 10000000061 *** .14
; 10000000069 *** .1399999999999999
; 10000000097 *** .1499999999999999

; (search-for-primes 100000000000 100000000099)
; 100000000003 *** .4500000000000002
; 100000000019 *** .44999999999999973
; 100000000057 *** .45999999999999996
; 100000000063 *** .4500000000000002
; 100000000069 *** .44999999999999973
; 100000000073 *** .4300000000000006
; 100000000091 *** .4399999999999995

; (search-for-primes 1000000000000 1000000000099)
; 1000000000039 *** 1.3899999999999997
; 1000000000061 *** 1.4000000000000004
; 1000000000063 *** 1.4000000000000004
; 1000000000091 *** 1.4100000000000001
