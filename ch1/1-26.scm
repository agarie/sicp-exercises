; The procedure `square` is O(1) under applicative order evaluation, as the
; parameter `x` is evaluated before the body of the function, `(* x x)`.
(define (square x) (* x x))

; With `square`, the procedure `(expmod base (/ exp 2) m)` is evaluated once
; and its result is squared. By calling it twice, as seen below, it is
; evaluated twice, thus "canceling" the logarithmic nature of the process.
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))
