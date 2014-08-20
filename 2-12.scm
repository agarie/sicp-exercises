(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (min a b)))

(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (max a b)))

; Exercise 2-12.
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* p c)))

(define (percentage i)
  (/ (width i) (center i)))

(define i_1 (make-center-percent 5 0.06))
(center i_1)
(width i_1)
(percentage i_1)
