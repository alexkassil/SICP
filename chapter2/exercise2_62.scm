;;;; Union set on ordered set

(define (union-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 set2)
	(else
	 (let ((x1 (car set1)) (x2 (car set2)))
	   (cond
	    ((= x1 x2)
	     (cons x1 (union-set (cdr set1) (cdr set2))))
	    ((< x1 x2)
	     (cons x1 (union-set (cdr set1) set2)))
	    ((> x1 x2)
	     (cons x2 (union-set set1 (cdr set2)))))))))