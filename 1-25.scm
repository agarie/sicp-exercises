(define (divides? a b)
  (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        ( else (* b (fast-expt b (- n 1))))))

; Answer: No, it wouldn't. `fast-expt` will compute b^n before computing the
; remainder, resulting in a extremely large intermediary value. On the other
; hand, `expmod` tries to reduce its argument at each step by calling
; `remainder`, thus ensuring the calculation is done with reasonable resources.
