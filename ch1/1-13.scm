; 1-13. (this should probably be a LaTeX file...)
;
; Prove that Fib(n) is the closest integer to \phi^n/sqrt(5), where \phi = (1 +
; sqrt(5))/2.
;
; First we prove that Fib(n) = (\phi^n - \psi^n)/sqrt(5).
;
; We can see that Fib(0) = 0 and Fib(1) = 1 by inspection. Assume that Fib(n)
; and Fib(n - 1) are valid, then:
;
; Fib(n) + Fib(n - 1) = [((phi^n - \psi^n) + (\phi^(n - 1) - \psi^(n - 1))]/sqrt(5)
;                     = [\phi^n + \phi^(n - 1) - \psi^n - \psi^(n - 1)]/sqrt(5)
;                     = [\phi^(n)(1 + 1/\phi) - \psi^(n)(1 + 1/\psi)]/sqrt(5)
;
; Let's show that (1 + 1/\phi) = \phi:
;
; (1 + 1/\phi) = (\phi + 1)/\phi                         ; Substitute \phi = (1 + sqrt(5))/2
;              = (1 + sqrt(5) + 2)/(1 + sqrt(5))         ; Multiply by 1 = (1 - sqrt(5))/(1 - sqrt(5))
;              = (3 - 3sqrt(5) + sqrt(5) = 5)/(1 - sqrt(5) + sqrt(5) - 5)
;              = (2 + 2sqrt(5))/4
;              = (1 + sqrt(5))/2 = \phi
;
; The same logic applies to the \psi term. Therefore:
;
; Fib(n) + Fib(n - 1) = (\phi^n * \phi - \psi^n * \psi)/sqrt(5)
;                     = (\phi^(n + 1) - \psi^(n + 1))/sqrt(5)
;                     = Fib(n + 1)
;
; In order to show that Fib(n) is the closest integer to the number g(n) =
; \phi^n/sqrt(5), we need to show that the distance between Fib(n) and g(n) is
; less than 1/2, that is, g(n) is closer to Fib(n) compared to Fib(n) - 1 and
; Fib(n) + 1.
;
; | Fib(n) - g(n) | < 1/2
; | (\phi^n - \psi^n)/sqrt(5) - \phi^n/sqrt(5) | < 1/2
; | -\psi^n/sqrt(5) | < 1/2
; | -\psi^n | < sqrt(5)/2                               ; Substitute \psi = (1 - sqrt(5))/2 and |x| = |-x|
; | ((1 - sqrt(5))/2) | < sqrt(5)/2
;
; We have that (1 - sqrt(5))/2 = -0.6180, thus:
;
; | (-0.6180)^n | < sqrt(5)/2 = 1.1180, for all n >= 0 (QED)
