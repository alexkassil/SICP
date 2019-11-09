
(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) 
	   n)
	  ((divides? test-divisor n) 
	   test-divisor)
	  (else (find-divisor 
		 n 
		 (next test-divisor)))))
  (= n (smallest-divisor n)))

(define (next divisor)
  (if (= divisor 2)
	  3
	  (+ divisor 2)))


(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (newline)
  (display elapsed-time))

(define (search-for-primes start)
  (define (start-search-for-primes num n start-time)
    (cond ((= n 0) (report-prime (- (runtime) start-time)))
	  ((prime? num) 
	   (display num) 
	   (newline)
	   (start-search-for-primes (+ num 2) (- n 1) start-time))
	  (else (start-search-for-primes (+ num 2) n start-time))))
  (start-search-for-primes (+ start 1) 3 (runtime)))

(search-for-primes 1000)

(search-for-primes 100000)

(search-for-primes 1000000)

(search-for-primes 10000000)

(search-for-primes 100000000)

(search-for-primes 1000000000)

(search-for-primes 10000000000)

(search-for-primes 100000000000)
; .63
(search-for-primes 1000000000000)
; 1.6
(search-for-primes 10000000000000)
; 6.1
(search-for-primes 100000000000000)
; 19.46


(/ 1.6 .63)
; 2.54
(/ 6.1 1.6)
; 3.81
(/ 19.46 6.1)
; 3.19







