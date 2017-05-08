;;;; Tree-map

(define (tree-map procedure tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (procedure tree))
	(else (cons (tree-map procedure (car tree))
		    (tree-map procedure (cdr tree))))))

;; Example
(define (square-tree tree)
  (tree-map square tree))
