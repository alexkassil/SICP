;;;; Deep reverse recursively

(define (r-deep-reverse l)
  (cond ((null? l) '())
	((not (pair? l)) l)
	(else (append (r-deep-reverse (cdr l)) (list (r-deep-reverse (car l)))))))


;;;; Reverse a list

;; Reversing a list using iteration by appending last value to new list
(define (reverse l)
  (define (reverse-iter l new)
    (if (null? l)
	new
	(reverse-iter (cdr l) (append (list (car l)) new))))
  (reverse-iter l (list)))


;; Reversing a list recursively

(define (r-reverse l)
  (cond ((null? l) '())
	(else (append (r-reverse (cdr l)) (list (car l))))))







