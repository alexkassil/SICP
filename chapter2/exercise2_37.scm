;;;; Matrices and vectors

;;; Vector is sequence of numbers, (1 2 3)
;;; Matrix is sequence of vectors, ((1 2) (3 4) (5 6))

;; Accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

;; Accumulate-n

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (first seqs))
	    (accumulate-n op init (remove-first seqs)))))

;; Returns sequence filled with first element from each sequence

(define (first seqs)
  (if (null? seqs) '()
      (cons (car (car seqs)) (first (cdr seqs)))))

;; Removes first entry from each sequence

(define (remove-first seqs)
  (if (null? seqs) '()
      (cons (cdr (car seqs)) (remove-first (cdr seqs)))))

;; Dot Product

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Matrix * Vector

(define (matrix-*-vector m v)
  (map (lambda (m_i) (dot-product m_i v)) m))

;; Transpose (flip; 2x3 matrix to 3x2)

(define (transpose m)
  (accumulate-n cons '() m))

;; Matrix * Matrix

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m_i) (matrix-*-vector cols m_i)) m)))