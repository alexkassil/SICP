;;;; Recursive equal procedure

(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
	((not (eq? (car l1) (car l2))) #f)
	(else (equal? (cdr l1) (cdr l2)))))