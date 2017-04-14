;;;; Recursive and Iterative Accumulate

;; Recursive Accumulate

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

;; Iterative Accumulate

(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
	result
	(accumulate-iter (next a) (combiner result (term a)))))
  (accumulate-iter a null-value))

;; Sum

(define (sum term a next b)
  (accumulate + 0 term a next b))

;; Product

(define (product term a next b)
  (accumulate * 1 term a next b))
