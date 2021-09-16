(define (accumulate combiner null-value term a next b)
    (if (> a b)
	null-value
	(combiner (term a) 
		  (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 2)

(sum (lambda (x) (/ 8.0 (* x (+ x 2)))) 1 (lambda (x) (+ x 4)) 100000)


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value)
)

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 2)

(sum (lambda (x) (/ 8.0 (* x (+ x 2)))) 1 (lambda (x) (+ x 4)) 100000)

(sum (lambda (x) (/ 8.0 (* x (+ x 2)))) 1 (lambda (x) (+ x 4)) 10000000)

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (pi n)
  (* 4.0 (product (lambda (n) (/ (* n (+ 2 n)) (* (+ n 1) (+ n 1)))) 2 (lambda (x) (+ 2 x)) n)))

(pi 10000)

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(factorial 5)





