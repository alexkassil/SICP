;;;; Union Set

(define (union-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 set2)
	((not (element-of-set? (car set1) set2))
	 (cons (car set1)
	       (union-set (cdr set1)
			  set2)))
	(else (union-set (cdr set1)
			 set2))))