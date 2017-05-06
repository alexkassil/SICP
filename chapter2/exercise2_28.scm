;;;; Fringe, flatten tree into list

(define (fringe tree)
  (cond ((not (pair? tree)) (list tree))
	(else (append (fringe (car tree)) (fringe (cadr tree))))))
