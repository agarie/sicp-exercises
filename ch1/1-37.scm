(define (cont-frac-rec n d k)
  (define (cont-frac-recursive i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))

(define (cont-frac-iter n d k)
  (define (cont-frac-iterative i acc)
    (if (= i 0)
      acc
      (cont-frac-iterative (- i 1) (/ (n i) (+ (d i) acc)))))
  (cont-frac-iterative k 0))

(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               100)

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                100)
