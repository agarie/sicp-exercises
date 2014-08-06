; Rabin-Miller Strong Pseudoprime Test.
; (from mathworld.wolfram.com)
;
; Given an odd integer n, let n = 2^r * s + 1 with s odd.
; Choose a random integer a, 1 <= a <= n - 1.
; If a^s = 1 (mod n) or a^(2js) = -1 (mod n) for some 0 <= j <= r - 1, n passes the test.
; A prime number will pass the test for all a.

(define (expmod base exp n)
  (define (modulo-n x)
    (remainder x n))
  (define (nontrivial-square x)
    (if (and (not (= x 1))
             (not (= x (- n 1)))
             (= (modulo-n (square x)) 1))
      0
      (square x)))
  (cond ((= exp 0) 1)
        ((even? exp) (modulo-n (nontrivial-square (expmod base (/ exp 2) n))))
        (else (modulo-n (* base (expmod base (- exp 1) n))))))

(define (miller-rabin-test n)
  (define (check x)
    (or (not (= x 0)) (= x 1)))
  (define (try-it a)
    (check (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 100))

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)

(prime? 13)
(prime? 169)
(prime? 853)
