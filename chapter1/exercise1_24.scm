;;; Timed prime test with fast prime function

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n 1000)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Fermat test for finding primes

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (round (random (- n 1))))))

(define (prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (prime? n (- times 1)))
	(else false)))

;; Searches for primes in a range

(define (search-for-primes start n)
  (timed-prime-test start)
  (cond ((> n 0) (search-for-primes (+ start 2) (- n 1))))) 