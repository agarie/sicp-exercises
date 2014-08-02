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
; 1000000007 *** 1.9999999999999997e-2
; 1000000009 *** 2.0000000000000004e-2
; 1000000021 *** 2.0000000000000004e-2
; 1000000033 *** 2.0000000000000004e-2
; 1000000087 *** .03
; 1000000093 *** .01999999999999999
; 1000000097 *** .03

; (search-for-primes 10000000000 10000000099)
; 10000000019 *** .07
; 10000000033 *** .06
; 10000000061 *** .07
; 10000000069 *** .08000000000000002
; 10000000097 *** .07000000000000006

; (search-for-primes 100000000000 100000000099)
; 100000000003 *** .22999999999999998
; 100000000019 *** .2300000000000001
; 100000000057 *** .2200000000000002
; 100000000063 *** .22999999999999998
; 100000000069 *** .22999999999999998
; 100000000073 *** .20999999999999996
; 100000000091 *** .21999999999999975

; (search-for-primes 1000000000000 1000000000099)
; 1000000000039 *** .69
; 1000000000061 *** .6800000000000002
; 1000000000063 *** .71
; 1000000000091 *** .7000000000000002
