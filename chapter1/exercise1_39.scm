;;;; tan x approximation with continued fractions

(define (cont-frac N D k)
  (define (cont-frac-counter i k)
    (if (= k 0)
	(/ (N i) (D i))
	(/ (N i) (+ (D i)
		    (cont-frac-counter (+ i 1) (- k 1))))))
  (cont-frac-counter 0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i) 
	       (if (= i 0)
		   x
		   (* -1 (square x))))
	     (lambda (i)
	       (+ (* 2 i) 1))
	     k))





