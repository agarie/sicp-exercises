(define (for-each p items)
  (if (null? items)
    true
    ; Immediately invoking anonymous function, like in JavaScript.
    ((lambda () (p (car items)) (for-each p (cdr items))))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
