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

(define (sub-interval i_1 i_2) ; i_1 - i_2
  (make-interval (- (lower-bound i_1) (lower-bound i_2))
                 (- (upper-bound i_1) (upper-bound i_2))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (eq-interval i_1 i_2)
  (and (= (lower-bound i_1) (lower-bound i_2))
       (= (upper-bound i_1) (upper-bound i_2))))

(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
     2))

; If i_3 = i_1 + i_2, we have:
;
; (width i_3)
; (/ (+ (lower-bound i_3) (upper-bound i_3)) 2)
; (+ (/ (lower-bound i_3) 2) (/ (upper-bound i_3) 2))
; (+ (/ (+ (lower-bound i_1) (lower-bound i_2)) 2)
;    (/ (+ (upper-bound i_1) (upper-bound i_2)) 2))
; (+ (/ (lower-bound i_1) 2)
;    (/ (lower-bound i_2) 2)
;    (/ (upper-bound i_1) 2)
;    (/ (upper-bound i_2) 2))
; (+ (/ (+ (lower-bound i_1) (upper-bound i_1)) 2)
;    (/ (+ (lower-bound i_2) (upper-bound i_2)) 2))
; (+ (width i_1)
;    (width i_2))
; q.e.d.

; For multiplication and division:
(define i_1 (make-interval 1.0 2.0))
(define i_2 (make-interval 0.5 1.5))

(width i_1)
(width i_2)

(* (width i_1) (width i_2))
(width (mul-interval i_1 i_2))

(/ (width i_1) (width i_2))
(width (div-interval i_1 i_2))
