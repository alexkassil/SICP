(define (sequence-sum term next a b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sequence-sum term next (next a) b))))

(define (sum-integers a b)
  (sequence-sum (lambda (x) x) (lambda (x) (+ x 1)) a b))

(sum-integers 1 10)

(define (sum-cubes a b)
  (sequence-sum (lambda (x) (* x x x)) (lambda (x) (+ x 1)) a b))

(sum-cubes 1 10)

(define (pi-sum a b)
  (sequence-sum (lambda (x) (/ 8.0 (* x (+ x 2)))) (lambda (x) (+ x 4)) a b))

(pi-sum 1 100000)

(define (integral a b f)
  (define dx 0.001)
  (* dx
     (sequence-sum (lambda (x) (f x)) (lambda (x) (+ x dx)) (+ a (/ dx 2.0)) b)))

(integral 0 10 (lambda (x) (* x x)))

(integral 0 1 (lambda (x) (* x x x)))



