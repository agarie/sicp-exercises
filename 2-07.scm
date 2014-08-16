(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (min a b)))

(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (max a b)))
