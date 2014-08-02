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
; 1000000007 *** .03
; 1000000009 *** .04
; 1000000021 *** .03
; 1000000033 *** .04000000000000001
; 1000000087 *** .03
; 1000000093 *** .04000000000000001
; 1000000097 *** .02999999999999997

; (search-for-primes 10000000000 10000000099)
; 10000000019 *** .10999999999999999
; 10000000033 *** .10999999999999999
; 10000000061 *** .12
; 10000000069 *** .10999999999999999
; 10000000097 *** .10999999999999999

; (search-for-primes 100000000000 100000000099)
; 100000000003 *** .3699999999999999
; 100000000019 *** .3600000000000001
; 100000000057 *** .3599999999999999
; 100000000063 *** .3500000000000001
; 100000000069 *** .3599999999999999
; 100000000073 *** .3500000000000001
; 100000000091 *** .3599999999999999

; (search-for-primes 1000000000000 1000000000099)
; 1000000000039 *** 1.1800000000000002
; 1000000000061 *** 1.1400000000000006
; 1000000000063 *** 1.1099999999999994
; 1000000000091 *** 1.099999999999999