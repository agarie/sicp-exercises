(define (filtered-accumulate predicate combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                                 (filtered-accumulate predicate combiner null-value term (next a) next b)))
        (else (filtered-accumulate predicate combiner null-value term (next a) next b))))

; Sum of the squares of the prime numbers between `a` and `b`.
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

(define (prime? n)
  (fast-prime? n 100))

(define (sum-sq-primes a b)
  (filtered-accumulate prime? + 0 square a (lambda (i) (+ i 1)) b))

(sum-sq-primes 2 10)
(sum-sq-primes 31 52)

; Product of all the positive integers less than n that are relatively prime to
; n, i.e. all positive integers i < n such that GCD(i, n) = 1.
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (product-pos-rel-prime n)
  (filtered-accumulate (lambda (i) (= 1 (gcd i n)))
                       *
                       1
                       (lambda (i) i)
                       1
                       (lambda (i) (+ i 1))
                       (- n 1)))

(product-pos-rel-prime 5)
