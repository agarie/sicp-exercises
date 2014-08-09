; Implement Simpson's rule using `sum`.
;
; integral(f; a, b) = h/3 * [y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_{n-2} + 4y_{n-1} + y_n]
;
; with h = (b - a) / n, n an even integer and y_k = f(a + kh).

(define (even? k)
  (= (remainder k 2) 0))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (constant k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (simpson-term h k)
    (if (> k n)
      0
      (+ (* (/ h 3) (constant k) (f (+ a (* k h)))) (simpson-term h (+ k 1)))))
  (simpson-term (/ (- b a) n) 0))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
