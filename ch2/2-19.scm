(define (cc amount coin-values)
        (cond ((= amount 0) 1)
              ((or (< amount 0) (no-more? coin-values)) 0)
              (else
                (+ (cc amount
                       (except-first-denomination coin-values))
                   (cc (- amount
                          (first-denomination coin-values))
                       coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 10 us-coins)
(cc 10 uk-coins)

; The order in `coin-values` is important because the algorithm looks for the
; numbers of combinations without the *first* element of `coin-values`, not the
; largest one. To allow for arbitrarily-ordered lists of coins, it should
; suffice to change `except-first-denomination` to retrieve the list without
; the largest value, which would be returned by `first-denomination`.
