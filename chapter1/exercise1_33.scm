;;;; Filtered Accumulator

(define (filtered-accumulate combiner null-value term a next b filter)
  (define current-value
    (if (filter a)
	(term a)
	null-value))
  (if (> a b)
      null-value
      (combiner current-value
		(filtered-accumulate combiner null-value term (next a)
				     next b filter))))


;; Sum of squares of primes

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (inc x) (+ x 1))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; Product of all the positive integers less than n that are 
;; relatively prime to n

(define (product-relative-primes n)
  (define (relatively-prime? x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime?))
