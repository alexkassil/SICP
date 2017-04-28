;;;; Reverse a list

;; Reversing a list using iteration by appending last value to new list
(define (reverse l)
  (define (reverse-iter l new)
    (if (null? l)
	new
	(reverse-iter (cdr l) (append (list (car l)) new))))
  (reverse-iter l (list)))



