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

; Use `fast-prime?` instead of `prime?`.
; (define (prime? n)
;   (= n (smallest-divisor n)))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; Benchmarking.
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
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
; 1000000007 *** 1.0000000000000009e-2
; 1000000009 *** 9.999999999999981e-3
; 1000000021 *** 1.0000000000000009e-2
; 1000000033 *** 1.0000000000000009e-2
; 1000000087 *** 1.0000000000000009e-2
; 1000000093 *** 1.0000000000000009e-2
; 1000000097 *** 9.999999999999981e-3

; (search-for-primes 10000000000 10000000099)
; 10000000019 *** 1.0000000000000009e-2
; 10000000033 *** 1.0000000000000009e-2
; 10000000061 *** 9.999999999999953e-3
; 10000000069 *** 1.0000000000000009e-2
; 10000000097 *** 1.0000000000000009e-2

; (search-for-primes 100000000000 100000000099)
; 100000000003 *** 2.0000000000000018e-2
; 100000000019 *** 9.999999999999953e-3
; 100000000057 *** 1.0000000000000009e-2
; 100000000063 *** 2.0000000000000018e-2
; 100000000069 *** 1.0000000000000009e-2
; 100000000073 *** 1.9999999999999962e-2
; 100000000091 *** 2.0000000000000018e-2

; (search-for-primes 1000000000000 1000000000099)
; 1000000000039 *** 2.0000000000000018e-2
; 1000000000061 *** 9.999999999999953e-3
; 1000000000063 *** 2.0000000000000018e-2
; 1000000000091 *** 2.0000000000000018e-2
