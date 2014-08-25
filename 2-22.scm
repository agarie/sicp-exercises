; The first function will create the list by removing elements from `items`,
; squaring them and appending to the head of another list (`answer`), thus
; generating the answer in reverse order.
;
; The second one is not generating a list, but a structure like the following:
; (cons nil (cons x_1 (cons x_2 (cons x_3 ...)) where x_i is the square of the
; i-th element of `items`.
;
; The "correct" method would involve appending the elements to the back of a
; list or using a vector (thus doing it in O(1) in memory).
