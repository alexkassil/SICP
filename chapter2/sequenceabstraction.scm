;;;; Deeper abstractions with sequences of operations

;; Return the sum of the odd leaves squared

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else (+ (sum-odd-squares
		  (car tree))
		 (sum-odd-squares
		  (cdr tree))))))

;; Returns list of even Fibonacci numbers up to n

(define (even-fibs n)
  (define (next k)
    (if (> k n)
	'()
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))

(define (fib k)
  (cond ((= k 0) 0)
	((= k 1) 1)
	(else (+ (fib (- k 1)) (fib (- k 2))))))

;;; These two functions have the same underlying pattering, they are both groups of signals
;;; 1 is (enumerate tree leaves) -> (filter odd?) -> (map square) -> (accumulate +, 0)
;;; 2 is (enumarate integers) -> (map fib) -> (filter even?) -> (accumulate cons, ())
;;; If these four functions are abstracted, 1 & 2 are just different orders of these 
;;; functions with different parameters

(define (map procedure items)
  (if (null? items)
      '()
      (cons (procedure (car items))
	    (map procedure (cdr items)))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate
		       (cdr sequence))))
	(else (filter predicate
		      (cdr sequence)))))
	
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ low 1)
	    high))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append
	       (enumerate-tree (car tree))
	       (enumerate-tree (cdr tree))))))

;;; Abstracted 1 & 2

(define (sum-odd-squares tree)
  (accumulate
   +
   0
   (map square
	(filter odd?
		(enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate 
   cons 
   '()
   (filter even?
	   (map fib
		(enumerate-interval 0 n)))))
	  
;;; With these abstractions we can use modules to make new programs by swapping out pieces

;; Constructs a list of the squares of the first n + 1 Fibonacci numbers

(define (list-fib-squares n)
  (accumulate
   cons
   '()
   (map square
	(map fib
	     (enumerate-interval 0 n)))))

;; Product of the squares of the odd integers in a sequence

(define (product-of-squares-of-odd-elements sequence)
  (accumulate
   *
   1
   (map square
	(filter odd? sequence))))






