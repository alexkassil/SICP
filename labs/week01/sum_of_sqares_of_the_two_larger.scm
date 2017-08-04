(define (sosottl x y z)
  (+ (square (max3 (min x y) (min y z) (min z x)))
	 (square (max3 (max x y) (max y z) (max z x)))))

(define (square x)
  (* x x))

(define (max3 x y z)
  (max (max x y) (max y z)))

(define (max x y)
  (if (> x y)
	  x
	  y))

(define (min x y)
  (if (< x y)
	  x
	  y))
	
