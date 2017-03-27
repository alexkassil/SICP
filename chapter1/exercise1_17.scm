(define (halve x)
  (/ x 2))

(define (double x)
  (* x 2))


(define (recursive-fast-* a b)
  (cond ((= a 1) b)
	((even? a) (recursive-fast-* (halve a) (double b)))
	(else (recursive-fast-* (- a 1) (+ b a)))))
