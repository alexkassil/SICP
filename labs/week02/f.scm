;;;; For each f, give a definition which results
;;;; in no error when evaluated

(define f 4)
f

(define (f) 4)
(f)

(define (f x) 4)
(f 3)

(define (f) (lambda () 4))
((f))

(define (f) (lambda () (lambda (x) 4)))
(((f)) 3)
