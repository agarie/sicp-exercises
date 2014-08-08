; Recursive.
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; Iterative.
(define (accumulate2 combiner null-value term a next b)
  (define (accumulate-iter i acc)
    (if (> i b)
      acc
      (accumulate-iter (next i) (combiner (term i) acc)))
    (accumulate-iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product (lambda (i) i) 1 (lambda (i) (+ i 1)) n))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)
(factorial 6)
