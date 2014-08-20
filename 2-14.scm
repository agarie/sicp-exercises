(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (min a b)))

(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (max a b)))

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

(define (add-interval i_1 i_2)
  (make-interval (+ (lower-bound i_1) (lower-bound i_2))
                 (+ (upper-bound i_1) (upper-bound i_2))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (= (lower-bound y) (upper-bound y))
    (error "Cannot divide by a zero-width interval!")
    (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

; 2.14.
(define a (make-center-percent 3.0 0.01))
(define b (make-center-percent 4.0 0.05))
(define one (make-interval 1 1))

(div-interval a a)
(div-interval a b)

; The example shown on the book.
(div-interval (mul-interval a b) (add-interval a b))
(div-interval one (add-interval (div-interval one a) (div-interval one b)))

; z0mg, they are different!!!
