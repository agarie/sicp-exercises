; From 2-02.
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment segment)
  (define (average a b) (/ (+ a b) 2.0))
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))

; Exercise 2-03.

; Implement a representation for rectangles in a plane. In terms of your
; constructors and selectors, create procedures that compute the perimeter and
; the area of a given rectangle.
(define (length-of-segment s)
  (sqrt (+ (expt (- (x-point (start-segment s)) (x-point (end-segment s))) 2)
           (expt (- (y-point (start-segment s)) (y-point (end-segment s))) 2))))

; Should also check if s_1 and s_2 are orthogonal (i.e. s_1 * s_2 = 0).
(define (make-rectangle s_1 s_2) (cons s_1 s_2))
(define (first-segment r) (car r))
(define (second-segment r) (cdr r))
(define (rec-height r) (length-of-segment (first-segment r)))
(define (rec-width r) (length-of-segment (second-segment r)))

(define (perimeter rectangle)
  (+ (* 2 (rec-height rectangle))
     (* 2 (rec-width rectangle))))

(define (area rectangle)
  (* (rec-height rectangle)
     (rec-width rectangle)))

; Now implement a different representation for rectangles. Can you design your
; system with suitable abstraction barriers so that the same perimeter and area
; procedures will work using either representation?

; p_1, ..., p_4 are clockwise ordered points.
(define (make-rectangle-2 p_1 p_2 p_3 p_4) (cons (make-segment p_1 p_2)
                                           (make-segment p_3 p_4)))

; Result.
(define r_1 (make-rectangle (make-segment (make-point 0 0)
                                          (make-point 0 1))
                            (make-segment (make-point 2 1)
                                          (make-point 2 0))))
(perimeter r_1)
(area r_1)

(define r_2 (make-rectangle-2 (make-point 0 0)
                              (make-point 0 1)
                              (make-point 2 1)
                              (make-point 2 0)))

(perimeter r_2)
(area r_2)
