;;;; nth roots computer

(define (repeated f times)
  (if (< times 1)
      (lambda (x) x)
      (compose f (repeated f (- times 1)))))

(define (n-root n)
  (lambda (x)
    (fixed-point
     ((repeated average-damp 
		(if (> n 3)
		    (- n 1)
		    1))
      (lambda (y)
	(/ x (expt y (- n 1)))))
     1.0)))





