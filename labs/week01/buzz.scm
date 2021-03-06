(define (buzz n)
  (cond ((equal? (remainder n 7) 0) 'buzz)
		((member? 7 n) 'buzz)
		(else n)))

(define (buzz-to n)
  (define (buzz-to-iter current)
	(print (buzz current))
	(if (not (= n current))
		(buzz-to-iter (+ current 1))))
  (buzz-to-iter 0))
