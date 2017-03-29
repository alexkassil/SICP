
(define (smallest-divisor n)
  (find-divisor n 2))
;; checks divisors of n from test-divisor to n, returning n if prime
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

;; O(sqrt(n))
(define (prime? n)
  (= n (smallest-divisor n)))

;;;Fermat test, using Fermat's Little Theorem,
;;;If n is prime, and a < n, then a^n % n = a,
;;;checks specified times random values of a < n
;;;returning true if no a to disprove primality is found

;;Quickly finds a^n % n

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
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

;;;Times prime test

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
