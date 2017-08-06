;;; 1.31 (a)

(define (product term a next b)
  (if (> a b)
	  1
	  (* (term a)
		 (product term (next a) next b))))

(define (factorial n)
  (product
   (lambda (x) x)
   1
   (lambda (x) (+ 1 x))
   n))

(define (pi/4)
  (product
   (lambda (x) (/ (* x (+ 2 x))
				  (* (+ 1 x) (+ 1 x))))
   2
   (lambda (x) (+ 2 x))
   10000))
