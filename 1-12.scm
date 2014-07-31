(define (pascal r c)
  (if (or (= c 1) (= r c))
    1
    (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))

(pascal 1 1)
(pascal 4 2)
(pascal 4 3)
(pascal 5 3)
