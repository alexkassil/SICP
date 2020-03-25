
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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n)
	 (fast-prime? n (- times 1)))
	(else false)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (newline)
  (display elapsed-time)
  (newline))

(define (search-for-primes start)
  (define (start-search-for-primes num n start-time)
    (cond ((= n 0) (report-prime (- (runtime) start-time)))
	  ((prime? num) 
	   (display num) 
	   (newline)
	   (start-search-for-primes (+ num 2) (- n 1) start-time))
	  (else (start-search-for-primes (+ num 2) n start-time))))
  (start-search-for-primes (+ start 1) 3 (runtime)))

(define primes '(100000000003 100000000019 100000000057 1000000000039 1000000000061 1000000000063 10000000000037 10000000000051 10000000000099 100000000000031 100000000000067 100000000000097))

(define (map f lst)
  (cond ((not (null? lst)) (f (car lst)) (map f (cdr lst)))))

(map timed-prime-test primes)
#|
100000000003 *** 
.7199999999999989

100000000019 *** 
.6599999999999966

100000000057 *** 
.6500000000000057

1000000000039 *** 
.6599999999999966

1000000000061 *** 
.6899999999999977

1000000000063 *** 
.6800000000000068

10000000000037 *** 
.7099999999999795

10000000000051 *** 
.7099999999999795

10000000000099 *** 
.710000000000008

100000000000031 *** 
.7800000000000011

100000000000067 *** 
.7800000000000011

100000000000097 *** 
.7800000000000011
|#
; Clearly all the time is about the same, due to us picking the same value for number of times to run the fermat testn












