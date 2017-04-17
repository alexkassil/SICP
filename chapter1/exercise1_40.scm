;;;; Cubic method

;; given a, b, and c return x -> x^3 + ax^2 + bx + x

(define (cubic a b c)
  (lambda (x)
    (+
     (cube x)
     (* a (square x))
     (* b x)
     c)))
