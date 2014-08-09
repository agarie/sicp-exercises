; Approximation of tan(x) by continued fractions.
(define (cont-frac n d k)
  (define (cont-frac-recursive i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(define pi 3.14159265359)
(tan-cf (/ pi 3) 10)
(tan-cf (/ pi 4) 10)
(tan-cf (/ pi 6) 10)
