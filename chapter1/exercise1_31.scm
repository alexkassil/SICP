;;;; Recursive and Iterative Product

;;; Recursive

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

;;; Iterative

(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
	result
	(product-iter (next a) (* result (term a)))))
  (product-iter a 1))

;;; pi approximation

(define (pi-product n)
  (define (pi-product-next x) (+ x 2))
  (define (pi-product-term x)
    (/ (* x (+ x 2)) (square (+ x 1))))
  (* 4.0 (product pi-product-term 2 pi-product-next n)))
