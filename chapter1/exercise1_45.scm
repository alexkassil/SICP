;;;; nth roots computer

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

;;; Helper functions

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f times)
  (if (< times 1)
      (lambda (x) x)
      (compose f (repeated f (- times 1)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
