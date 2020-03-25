
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

(define primes '(100000000003 100000000019 100000000057 1000000000039 1000000000061 1000000000063 10000000000037 10000000000051 10000000000099 100000000000031 100000000000067 100000000000097))



(define (next22 divisor)
  (+ divisor 1))

(define (next23 divisor)
  (if (= divisor 2)
	  3
	  (+ divisor 2)))


(define (prime22? n)
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) 
	   n)
	  ((divides? test-divisor n) 
	   test-divisor)
	  (else (find-divisor 
		 n 
		 (next22 test-divisor)))))
  (= n (smallest-divisor n)))

(define (prime23? n)
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) 
	   n)
	  ((divides? test-divisor n) 
	   test-divisor)
	  (else (find-divisor 
		 n 
		 (next23 test-divisor)))))
  (= n (smallest-divisor n)))

(define (compare primes)
  (define (time prime? prime start-time)
    (prime? prime)
    (- (runtime) start-time))
  (define (comp prime)
    (newline)
    (display prime)
    (newline)
    (display "ratio between excercise 22 and 23 next function ")
    (display (/ (time prime22? prime (runtime)) (time prime23? prime (runtime))))
    (newline))
  (cond ((not (null? primes)) (comp (car primes)) (compare (cdr primes)))))

(compare primes)

#|
100000000003
ratio between excercise 22 and 23 next function .9032258064516306
100000000019
ratio between excercise 22 and 23 next function 1.647058823529402
100000000057
ratio between excercise 22 and 23 next function 1.611111111111109
1000000000039
ratio between excercise 22 and 23 next function 1.7307692307692177
1000000000061
ratio between excercise 22 and 23 next function 1.7169811320754615
1000000000063
ratio between excercise 22 and 23 next function 1.749999999999983
10000000000037
ratio between excercise 22 and 23 next function 1.7168674698795108
10000000000051
ratio between excercise 22 and 23 next function 1.7065868263473087
10000000000099
ratio between excercise 22 and 23 next function 1.733333333333342
100000000000031
ratio between excercise 22 and 23 next function 2.0532445923460885
100000000000067
ratio between excercise 22 and 23 next function 1.6958955223880579
100000000000097
ratio between excercise 22 and 23 next function 1.7375478927203083
|#

; The speed is slightly under 2, seems to be around 1.6 to 1.75 (with 2 edge cases)
; My guess for this discrepency is the remainder function might be faster for even vs odd numbers



