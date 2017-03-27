(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-* a b)
  (fast-*-iter a b 0))

(define (fast-*-iter a b n)
  (cond ((= a 0) n)
	((even? a) (fast-*-iter (halve a) (double b) n))
	(else (fast-*-iter (- a 1) b (+ n b)))))

