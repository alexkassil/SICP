;;;; Matrices and vectors

;;; Vector is sequence of numbers, (1 2 3)
;;; Matrix is sequence of vectors, ((1 2) (3 4) (5 6))

;; Dot Product

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Matrix * Vector

(define (matrix-*-vector m v)
  (map 