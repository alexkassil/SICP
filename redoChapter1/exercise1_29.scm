(define (sequence-sum term next a b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sequence-sum term next (next a) b))))

(define (cube x) (* x x x))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (helper k)
    (cond ((= k n) (y n))
	  ((= (remainder k 2) 1) (+ (* 4 (y k)) (helper (+ k 1))))
	  (else (+ (* 2 (y k)) (helper (+ k 1))))))
  (* (/ h 3.0) (+ (y 0) (helper 1))))

(simpsons-rule cube 0 1 100)

(simpsons-rule cube 0 1 1000)