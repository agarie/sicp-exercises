(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (< n 0) (< d 0)) (cons (abs (/ n g)) (abs (/ d g))))        ; -/-
          ((or (< n 0) (< d 0)) (cons (- (abs (/ n g))) (abs (/ d g)))) ; +/- or -/+
          (else (cons (/ n g) (/ d g))))))                              ; +/+

(print-rat (make-rat 2 4))
(print-rat (make-rat (- 2) 4))
(print-rat (make-rat 2 (- 4)))
(print-rat (make-rat (- 2) (- 4)))
