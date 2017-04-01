;;; Exhaustive Fermat Test
;;; Employs Fermat's little theorem to test every value n less than a

(define (fermat-test-iter n a)
  (cond ((= a n) #t)
	((not (= (expmod a n n) a)) #f)
	(else (fermat-test-iter n (+ a 1)))))

(define (fermat-test n)
  (fermat-test-iter n 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

;;; Tests

;; Primes

(fermat-test 13)
(fermat-test 22777)
(fermat-test 100003)

;; Composites

(fermat-test 20)
(fermat-test 51)
(fermat-test 100001)

;; Carmichael numbers

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)
