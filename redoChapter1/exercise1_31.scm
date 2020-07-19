(define (prod-recursive term next a b)
  (if (> a b)
	  1
	  (* (term a)
		 (prod-recursive term next (next a) b))))

(define (prod-iter term next a b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial x)
  (prod-iter (lambda (x) x) (lambda (x) (+ x 1)) 1 x))

(factorial 0)
(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)

(define (pi n)
  (* 4.0 (prod-iter (lambda (n) (/ (* n (+ 2 n)) (* (+ n 1) (+ n 1)))) (lambda (x) (+ 2 x)) 2 n)))

(pi 10000)

