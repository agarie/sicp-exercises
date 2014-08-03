; Prime testing.
(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (+ test-divisor 1)))))

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
; 1000000007 *** .07
; 1000000009 *** .06999999999999998
; 1000000021 *** .07
; 1000000033 *** .07
; 1000000087 *** .06999999999999995
; 1000000093 *** .07000000000000006
; 1000000097 *** .06999999999999995

; (search-for-primes 10000000000 10000000099)
; 10000000019 *** .22000000000000008
; 10000000033 *** .21999999999999997
; 10000000061 *** .21999999999999997
; 10000000069 *** .22999999999999998
; 10000000097 *** .2300000000000002

; (search-for-primes 100000000000 100000000099)
; 100000000003 *** .7199999999999998
; 100000000019 *** .7200000000000002
; 100000000057 *** .7199999999999998
; 100000000063 *** .7300000000000004
; 100000000069 *** .7400000000000002
; 100000000073 *** .7199999999999998
; 100000000091 *** .7199999999999998

; (search-for-primes 1000000000000 1000000000099)
; 1000000000039 *** 2.2700000000000005
; 1000000000061 *** 2.2799999999999994
; 1000000000063 *** 2.3000000000000007
; 1000000000091 *** 2.26
