(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (guess-small-enough? initial current)
  (< (/ (abs (- initial current)) initial) 0.000001))

(define (cube-iter guess x)
  (if (guess-small-enough? guess (improve guess x))
    (improve guess x)
    (cube-iter (improve guess x)
               x)))

(cube-iter 5.0 27)
