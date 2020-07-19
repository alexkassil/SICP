(define (sequence-sum term next a b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sequence-sum term next (next a) b))))

(define (sum term next a b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0))

(sum (lambda (x) (* x x x)) (lambda (x) (+ x 1)) 0 10)

(sum (lambda (x) (/ 8.0 (* x (+ x 2)))) (lambda (x) (+ x 4)) 1 10000000)






