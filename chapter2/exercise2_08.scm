;;;; Interval Subtract

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (car x) (cdr x)))

(define (upper-bound x) (max (car x) (cdr x)))

(define (sub-interval x y)
  (add-interval x 
		(make-interval
		 (- (upper-bound y)) 
		 (- (lower-bound y)))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
		    (lower-bound y))
		 (+ (upper-bound x)
		    (upper-bound y))))
