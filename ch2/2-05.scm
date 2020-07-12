(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (factor-power base n)
  (define (how-many m count)
    (if (= (remainder m base) 0)
      (how-many (/ m base) (+ count 1))
      count))
  (how-many n 0))

(define (car c)
  (factor-power 2 c))

(define (cdr c)
  (factor-power 3 c))

; Tests.
(define c_1 (cons 1 4))
(car c_1)
(cdr c_1)

(define c_2 (cons 7 22))
(car c_2)
(cdr c_2)

(define c_3 (cons 3 5))
(car c_3)
(cdr c_3)
