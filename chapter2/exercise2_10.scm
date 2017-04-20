;;;; Error handling division

(define (div-interval x y)
  (if (or (or (= (lower-bound x) 0)
	      (= (upper-bound x) 0))
	  (or (= (lower-bound y) 0)
	      (= (upper-bound y) 0)))
      (error "Range(s) span zero")
      (mul-interval x
		    (make-interval
		     (/ 1.0 (upper-bound y))
		     (/ 1.0 (lower-bound y))))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
	       (lower-bound y)))
	(p2 (* (lower-bound x)
	       (upper-bound y)))
	(p3 (* (upper-bound x)
	       (upper-bound y)))
	(p4 (* (upper-bound x)
	       (lower-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
       
