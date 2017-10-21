;; Returm the sum of the squares of the two larger integers

(define (sosottl x y z)
  (- (+ (square x) (square y) (square z)) (min3 x y z)))

(define (square x)
  (* x x))

(define (min x y)
  (if (< x y)
	  x
	  y))

(define (min3 x y z)
  (min (min x y) (min y z)))
