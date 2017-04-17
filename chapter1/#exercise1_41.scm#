;;;; Double is a procedure that returns a procedure that applies the 
;;;; original procedure twice

(define (inc x)
  (+ x 1))

(define (double f)
  (lambda (x)
    (f (f x))))

; Returns 21

(((double (double double)) inc) 5)

