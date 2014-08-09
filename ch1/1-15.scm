(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.001))
    angle
    (p (sine (/ angle 3.0)))))

; a. For angle = 12.15, it should be used 5 times.
; b. In space, O(e ^ a), while in number of steps it is O(log a).

(sine (* 3.1415 2.0))
(sine (* 3.1415 0.50))
