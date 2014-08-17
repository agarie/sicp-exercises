(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (min a b)))

(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (max a b)))

(define (add-interval i_1 i_2)
  (make-interval (+ (lower-bound i_1) (lower-bound i_2))
                 (+ (upper-bound i_1) (upper-bound i_2))))

; Define sub-interval, where intervals are entities related to inexact
; quantities like resistances.
(define (sub-interval i_1 i_2) ; i_1 - i_2
  (make-interval (- (lower-bound i_1) (lower-bound i_2))
                 (- (upper-bound i_1) (upper-bound i_2))))

; Tests.
(define i_1 (make-interval 1.0 2.0))
(define i_2 (make-interval 0.5 1.5))

(define (eq-interval i_1 i_2)
  (and (= (lower-bound i_1) (lower-bound i_2))
       (= (upper-bound i_1) (upper-bound i_2))))

(sub-interval i_1 i_2)
(eq-interval (sub-interval (add-interval i_1 i_2) i_2) i_1)
