;;;; Count Leaves as accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

(define (count-leaves t)
  (accumulate
   +
   0
   (map (lambda (x) 1)
	(enumerate-tree t))))

(define (enumerate-tree t)
  (cond ((null? t) '())
	((not (pair? t)) (list t))
	(else (append (enumerate-tree (car t))
		      (enumerate-tree (cdr t))))))


;;; Count Leaves

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))


