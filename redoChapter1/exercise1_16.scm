(define (even? n)
  (= (remainder n 2) 0))
(define (expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (expt-iter a (square b) (/ n 2)))
	  (else (expt-iter (* b a) b (- n 1)))))
  (expt-iter 1 b n))

(expt 2 8)
(expt 2 7)
(expt 2 6)

