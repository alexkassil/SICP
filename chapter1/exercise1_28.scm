;;; Miller-Rabin test
;;; The unfoolable primality test

;; Checks for nontrivial square roots of 1 mod n

(define (nontrivial-sqrt? a n)
  (= (remainder (- (square a) 1) n) 0))

;; Miller-Rabin test using default exponentiation function

(define (fermat a n)
  (remainder (- (expt a (- n 1)) 1) n))




