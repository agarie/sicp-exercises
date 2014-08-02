(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; Recursive.
; It decreases `a` until it reaches 0, then it increases b by the same amount.
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; Iterative.
; It decreases a, but increases b at the same time.
(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))
