
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
		 (+ test-divisor 1)))))
  (= n (smallest-divisor n)))

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
; 1.11
(search-for-primes 1000000000000)
; 3.56
(search-for-primes 10000000000000)
; 13.91
(search-for-primes 100000000000000)
; 43.93


(/ 3.56 1.11)
; 3.21
(/ 13.91 3.56)
; 3.91
(/ 43.93  13.91)
; 3.15

(sqrt 10)
; 3.162
; Increase in 10x results in a ~ sqrt(10) increase in time









