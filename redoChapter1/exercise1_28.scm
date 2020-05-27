; Alternate form of fermat's little theoren
; for all a < n, if n is prime, a^(n-1) % n == 1

(define (expmod base exp m)
  (define (signal initial end)
    ;(display "\n")
    ;(display initial)
    ;(display "\n")			
    ;(display end)
    ;(display "\n")
    (if (and (not (= initial (- m 1))) (not (= initial 1)) (= end 1)) 0 end))
  (cond ((= base 0) 0) ; signal that non trivial square root
	((= exp 0) 1)
	((even? exp)
	 (signal (expmod base (/ exp 2) m)
		 (remainder 
		  (square (expmod base (/ exp 2) m))
		  m)))
	(else
	 (remainder 
	  (* base (expmod base (- exp 1) m))
	  m))))

(expmod 2 4 5)

(define (even? n)
  (= (remainder n 2) 0))

(define (miller-rabin-test n val)
  (= (expmod val (- n 1) n) 1))

(define (fast-prime? n val)
  (cond ((= val n) true)
	((miller-rabin-test n val)
	 (fast-prime? n (+ val 1)))
	(else false)))

(fast-prime? 5 2)
(fast-prime? 561 2)
(fast-prime? 1105 2)
(fast-prime? 1729 2)
(fast-prime? 13 2)
(fast-prime? (* 4 4 4 4) 2)







