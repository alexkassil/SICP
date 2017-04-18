;;;; cons, car, and cdr as one number

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (2-iter n current)
    (if (= 1 (modulo current 2))
	n
	(2-iter (+ n 1) (/ current 2))))
  (2-iter 0 z))

(define (cdr z)
  (define (3-iter n current)
    (if (not (= 0 (modulo current 3)))
	n
	(3-iter (+ n 1) (/ current 3))))
  (3-iter 0 z))


