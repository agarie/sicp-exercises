(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (guess-small-enough? initial current)
  (< (/ (abs (- initial current)) initial) 0.000001))

; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))
;
; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))

(define (sqrt-iter guess x)
  (if (guess-small-enough? guess (improve guess x))
    (improve guess x)
    (sqrt-iter (improve guess x)
               x)))

(sqrt-iter 0.1 2)
(sqrt-iter 2.0 3)
(sqrt-iter 10000.0 4354214545)
