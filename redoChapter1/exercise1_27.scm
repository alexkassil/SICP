(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder 
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder 
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (fermat-test n val)
  (= (expmod val n n) val))

(define (fast-prime? n val)
  (cond ((= val n) true)
	((fermat-test n val)
	 (fast-prime? n (+ val 1)))
	(else false)))

(fast-prime? 561 1)
(fast-prime? 1105 1)
(fast-prime? 1729 1)
; These all (sadly) return true









