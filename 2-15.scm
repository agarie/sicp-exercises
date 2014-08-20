; Eva Lu Ator is mostly right: if we don't repeat intervals in a formula, we
; can generally expect the resulting uncertainty to be lower than if we had
; some repeated values. So par2 is better than par1.
;   However, this is not always true, because it is possible to remove
; uncertainty by subtracting intervals:
;
;    a = |a| +- r
;    b = |b| +- p
;    a - b = (|a| - |b|) +- (r - p)
