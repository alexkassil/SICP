;;;; Simpson's Rule

;; Simpson's Rule Sum

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

;; Increment

(define (inc x) (+ x 1))

;; Integral using Simpson's Rule

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
	     ((odd? k) 4)
	     (else 2))
       (yk k)))
  (* (/ h 3.0)
     (sum simpson-term 0 inc n)))








