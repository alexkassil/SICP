(define (t f)
  (lambda (x) (f (f (f x)))) )

(define (s x)
  (+ 1 x))

((t s) 0)
; 3

((t (t s)) 0)
; 9

(((t t) s) 0)
; 27
