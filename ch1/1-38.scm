(define (cont-frac n d k)
  (define (cont-frac-recursive i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))

; d => 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10...
(define (euler-number k)
  (let ((n (lambda (i) 1.0))
        (d (lambda (i) (if (= 0 (remainder (+ i 1) 3))
                         (* 2 (/ (+ i 1) 3))
                         1))))
    (cont-frac n d k)))

(+ 2 (euler-number 1000))
