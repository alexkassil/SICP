;;;; Simpson's Rule

;; Sigma

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

;; Integral using Simpson's Rule

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (display h))








