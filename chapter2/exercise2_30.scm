;;;; Square-tree procedure

;; Recursive Square-tree

(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))))))

;; Square-tree using map

(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (* sub-tree sub-tree)))
       tree))

(define (map procedure items)
  (if (null? items)
      '()
      (cons (procedure (car items))
	    (map procedure (cdr items)))))

;; Scale-tree

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree sub-tree factor)
	     (* sub-tree sub-tree)))
       tree))

