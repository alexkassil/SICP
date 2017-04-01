;;; Miller-Rabin test
;;; The unfoolable primality test

;; Checks for nontrivial square roots of 1 mod n

(define (nontrivial-sqrt? a n)
  (= (remainder (- (square a) 1) n) 0))

;; Miller-Rabin test using default exponentiation function

(define (fermat a n)
  (remainder (- (expt a (- n 1)) 1) n))

(define (fermat-test n)
  (define (try-it a)
    (= (fermat a n) 0))
  (try-it (+ 2 (random (- n 2)))))

(define (slow-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (slow-prime? n (- times 1)))
	(else false)))




