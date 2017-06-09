;;;; Set with duplicates (just a list?)

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1)
				 set2)))
	(else (intersection-set (cdr set1)
				set2))))

(define (union-set set1 set2)
  (append set1 set2))

;;;; Union set is now O(1) instead of O(n^2)
;;;; Append set is now O(1) instead of O(n)