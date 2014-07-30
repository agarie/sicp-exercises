(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter b (/ n 2) (* a (square b))))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(fast-expt-iter 42 100 1)
