(define (product f a next b)
  (if (> a b)
    1
    (* (f a) (product f (next a) next b))))

(define (product-iter f a next b)
  (define (g current acc)
    (if (> current b)
      acc
      (g (next current) (* (f current) acc))))
  (g a 1))

(define (factorial n)
  (product-iter (lambda (i) i) 1 (lambda (i) (+ i 1)) n))

(factorial 6)

; pi / 2 = (2/1 * 2/3) * (4/3 * 4/5) * ... = product of [2n / (2n - 1) *  2n / (2n + 1)] from n = 1
; to infinity.
(define (wallis-term i)
  (/ (* 4.0 i i)
     (* (- (* 2.0 i) 1.0)
        (+ (* 2.0 i) 1.0))))

(define (pi m)
  (* 2.0 (product-iter wallis-term 1 (lambda (i) (+ i 1)) m)))

(pi 10)
(pi 100)
(pi 1000)
(pi 10000)
(pi 100000)
(pi 1000000) ; Should start taking a visible time.
