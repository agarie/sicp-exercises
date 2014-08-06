; Prime testing.
(define (divides? a b)
  (= (remainder b a) 0))

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

(define (very-fast-prime? n)
  (fast-prime? n 100))

(very-fast-prime? 561)
(very-fast-prime? 1105)
(very-fast-prime? 1729)
(very-fast-prime? 2465)
(very-fast-prime? 2821)
(very-fast-prime? 6601)
