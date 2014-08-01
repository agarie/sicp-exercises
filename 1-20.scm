; The procedure in question.
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; And it should be evaluated at (206, 40).
(gcd 206 40)

; Normal order.
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40))
; (if (= 40 0) 206 (gcd 40 6))
; (gcd 40 6)
; (if (= 6 0) 40 (gcd 6 (remainder 40 6)))
; (if (= 6 0) 40 (gcd 6 4))
; (gcd 6 4)
; (if (= 4 0) 6 (gcd 4 (remainder 6 4)))
; (if (= 4 0) 6 (gcd 4 2))
; (gcd 4 2)
; (if (= 2 0) 4 (gcd 2 (remainder 4 2))
; (if (= 2 0) 4 (gcd 2 0))
; (gcd 2 0)
; (if (= 0 0) 2 (gcd 0 (remainder 0 2))
; 2

; Applicative order.
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40))
; (if (= 40 0) 206 (gcd 40 6))
; (gcd 40 6)
; (if (= 6 0) 40 (gcd 6 (remainder 40 6)))
; (if (= 6 0) 40 (gcd 6 4))
; (gcd 6 4)
; (if (= 4 0) 6 (gcd 4 (remainder 6 4)))
; (if (= 4 0) 6 (gcd 4 2))
; (gcd 4 2)
; (if (= 2 0) 4 (gcd 2 (remainder 4 2))
; (if (= 2 0) 4 (gcd 2 0))
; (gcd 2 0)
; (if (= 0 0) 2 (gcd 0 (remainder 0 2))
; (if (= 0 0) 2 (gcd 0 2)
; 2

; Answer: 4 times with normal order evaluation, 5 with applicative order.
