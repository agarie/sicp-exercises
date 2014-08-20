; Not without extra constraints. The simple explanation is that our interval
; arithmetic package does not have the structure of a algebraical field[1]. For
; example, if A is an interval, A/A should be the unitary interval (1, 1), and
; it isn't. Or that the distributive property doesn't hold[2].
;
; [1]: http://stackoverflow.com/questions/14130878/sicp-2-16-interval-arithmetic-scheme
; [2]: http://wiki.drewhess.com/wiki/SICP_exercise_2.16
;
; Lots of resources on interval arithmetics: http://www.cs.utep.edu/interval-comp/main.html
