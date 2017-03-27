(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
		 (- counter 1)
		 (* b product))))

(define (old-fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (old-fast-expt b (/ n 2))))
	(else (* b (old-fast-expt b (- n 1))))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0)
	 a)
	((even? n)
	 (fast-expt-iter (square b) (/ n 2) a))
	(else
	 (fast-expt-iter b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))


