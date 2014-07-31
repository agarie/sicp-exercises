(define (sum_of_squares x y) (+ (* x x) (* y y)))
(define (sum_of_biggest a b c) (cond ((> a b) (if (> b c)
                                                  (sum_of_squares a b)
                                                  (sum_of_squares a c)))
                                     ((> a c) (sum_of_squares a b))
                                     (else (sum_of_squares b c))))

(sum_of_biggest 1 2 3)
