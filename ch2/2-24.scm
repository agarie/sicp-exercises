(list 1 (list 2 (list 3 4)))

; The value printed by the interpreter:
;   (1 (2 (3 4)))
; which is the same as:
;   (cons 1 (cons (cons 2 (cons (cons 3 (cons 4 '())) '()) '())))
