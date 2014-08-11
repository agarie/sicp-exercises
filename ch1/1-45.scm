(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (fixed-point f first-guess)
  (define tolerance 0.0000001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

; Now, for the actual exercise...
(define (nth-root n x)
  (let ((nth-average-damp (repeated average-damp (floor (/ (log n) (log 2)))))
        (nth-function (lambda (y) (/ x (expt y (- n 1))))))
    (fixed-point (nth-average-damp nth-function) 1.0)))

; Tests.
(nth-root 2 2)
(nth-root 4 16)
(nth-root 17 123142)
(nth-root 10 1024)
