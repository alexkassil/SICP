;;;; Reverse in terms of fold left and fold right

;; fold right

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op
		      initial
		      (cdr sequence)))))

;; fold left

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

;;; Reverse

(define (reverse sequence)
  (fold-right
   (lambda (x y) (append y (list x))) '() sequence))

(define (reverse sequence)
  (fold-left
   (lambda (x y) (cons y x)) '() sequence))