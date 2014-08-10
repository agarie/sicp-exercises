(define (double f)
  (lambda (x) (f (f x))))

((double (lambda (x) (+ x 1))) 1)
(((double (double double)) (lambda (x) (+ x 1))) 5)
(((double (double double)) (lambda (x) (+ x 1))) 0)
(((double (double (double double))) (lambda (x) (+ x 1))) 0)
