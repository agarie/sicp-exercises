(define (f_rec n)
  (if (< n 3)
    n
    (+ (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3))))))

(define (f_iter n)
  (f_iter_acc n 2 1 0))

(define (f_iter_acc m a b c)
  (if (= m 0)
    c
    (f_iter_acc (- m 1) (+ a (* b 2) (* c 3)) a b)))

(f_rec 5)
(f_iter 5)

(f_rec 7)
(f_iter 7)
