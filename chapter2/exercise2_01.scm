;;;; Exercise 2.01 Better version of make-rat that supports negatives

;; Constructor

(define (make-rat n d)
  (define g (gcd n d))
  (if (xor (< n 0) (< d 0)) 
      (cons (* -1 (abs n)) (abs d))
      (cons (abs n) (abs d))))

;; Extras
(define (xor a b)
  (not (boolean=? a b)))
