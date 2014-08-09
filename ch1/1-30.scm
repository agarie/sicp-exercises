(define (sum term a next b)
  (define (iter a result) ; `result` is generally called `accumulator`.
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))
