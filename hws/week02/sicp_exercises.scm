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

;;; 1.32 (a)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
	  null-value
	  (combiner (term a)
				(accumulate combiner
							null-value
							term
							(next a)
							next
							b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))


(define (product term a next b)
  (accumulate * 1 term a next b))

;;; 1.33

(define (filter-accumulate filter combiner null-value term a next b)
  (if (> a b)
	  null-value
	  (combiner (if (filter a) (term a) null-value)
				(filter-accumulate filter
								   combiner
								   null-value
								   term
								   (next a)
								   next
								   b))))

(define (sum-of-squares-primes a b)
  (filter-accumulate prime?
					 +
					 0
					 (lambda (x) (* x x))
					 a
					 (lambda (x) (+ 1 x))
					 b))

(define (prod-<n-relative-prime n)
  (filter-accumulate (lambda (x)
					   (and (equals? (gcd x n) 1)
							(not (equals? n x))))
					 *
					 1
					 (lambda (x) x)
					 1
					 (lambda (x) (+ x 1))
					 n))

;;; 1.40

(define (cubic a b c)
  (lambda (x)
	(+
	 (* x x x)
	 (* a x x)
	 (* b x)
	 c)))

;;; 1.41

(define (inc x) (+ 1 x))

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)

;;; 1.43

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  (if (= times 1)
      (lambda (x)
		(f x))
      (compose f (repeated f (- times 1)))))

;;; 1.46










					 
