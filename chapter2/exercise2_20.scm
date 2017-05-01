;;;; Same parity arbitrary length procedure

(define (same? x y)
  (or (and (even? x) (even? y)) (and (odd? x) (odd? y))))

(define (same-parity x . i)
  (define (same-parity-iter args return)
    (cond ((null? args) return)
	  ((same? x (car args)) 
	   (same-parity-iter (cdr args) (append return (list (car args)))))
	  (else (same-parity-iter (cdr args) return))))
  (same-parity-iter i (list x)))


