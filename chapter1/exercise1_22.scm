;;;Displays time to check primality based on supplied prime test

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
  
(define (smallest-divisor n)
  (smart-find-divisor n 2))

(define (smart-find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	((= test-divisor 2) (smart-find-divisor n (+ test-divisor 1)))
	(else (smart-find-divisor n (+ test-divisor 2)))))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;;Checks for primes in a range, displaying search times

(define (search-for-primes start n)
  (timed-prime-test start)
  (cond ((> n 0) (search-for-primes (+ start 2) (- n 1)))))









