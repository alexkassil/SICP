(define (expmod1 base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder 
	  (square (expmod1 base (/ exp 2) m))
	  m))
	(else
	 (remainder 
	  (* base (expmod1 base (- exp 1) m))
	  m))))


(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (test expmod prime start-time)
  (expmod (- prime 1) prime prime)
  (display (- (runtime) start-time))
  (newline))

(test expmod1 205201 (runtime))
; 0 seconds
(test expmod2 205201 (runtime))
; 3.74 seconds

; The difference is due to the fact that huge numbers are computed with expmod2 and that makes the numeric operations no longer O(1) but O(log(n)) where n is the size of the integers





