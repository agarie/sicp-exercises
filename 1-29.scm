; Implement Simpson's rule using `sum`.
;
; integral(f; a, b) = h/3 * [y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_{n-2} + 4y_{n-1} + y_n]
;
; with h = (b - a) / n, n an even integer and y_k = f(a + kh).

(define (even? k)
  (= (remainder k 2) 0))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (simpson-term h k)
    (cond ((= k 0) (+ (* (/ h 3) (f a)) (simpson-term h (+ k 1))))
          ((= k n) (* (/ h 3) (f b)))
          ((even? k) (+ (* (/ h 3) (* 2 (f (+ a (* k h))))) (simpson-term h (+ k 1))))
          (else (+ (* (/ h 3) (* 4 (f (+ a (* k h))))) (simpson-term h (+ k 1))))))
  (simpson-term (/ (- b a) n) 0))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
