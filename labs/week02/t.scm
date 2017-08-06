(define (t f)
  (lambda (x) (f (f (f x)))) )

(define 1+ (lambda (x) (+ 1 x)))

((t 1+) 0)
; 3

((t (t 1+)) 0)
; 9

(((t t) 1+) 0)
; 27

((t (t (t (t 1+)))) 0)
; 81

