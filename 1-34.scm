(define (f g)
  (g 2))

(f square)
(f (lambda (x) (* x (+ x 1))))

(f f)
; (f f) -> (f 2) -> (2 2) -> BEEP! The object 2 is not applicable.
