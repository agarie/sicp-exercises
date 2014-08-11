(define (iterative-improve check-guess improve)
  (define (inner guess)
    (let ((better (improve guess)))
      (if (check-guess guess better)
        better
        (inner better))))
  inner)

(define (average x y) (/ (+ x y) 2))

(define (sqrt-iter guess x)
  ((iterative-improve (lambda (old current) (< (/ (abs (- old current)) old) 0.00001))
                      (lambda (guess) (average guess (/ x guess)))) guess))

(sqrt-iter 1.0 2)

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (fixed-point f guess)
  (let ((fixed-point-inner (iterative-improve (lambda (old current)
                                                (< (abs (- old current)) 0.00001))
                                              f)))
    (fixed-point-inner guess)))

(fixed-point cos 1.0)
