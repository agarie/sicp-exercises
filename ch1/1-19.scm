; T_{pq}(a, b) = (bq + aq + ap, bp + aq)
; T^2_{pq}(a, b) = (b(q^2 + 2pq) + a(2q^2 + 2pq + p^2),  b(q^2 + p^2) + a(q^2 + 2pq))
;
; So we have: T_{p'q'} = T^2_{pq}.
;
; p' = q^2 + p^2
; q' = q^2 + 2pq

(define (even? n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))

(fib 3)
(fib 5)
(fib 10)
(fib 50)
