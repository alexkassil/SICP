;;;; List -> Tree partial

;;; Make and View Tree Elements

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;;; Various Binary Tree Representations

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-set?
	  x
	  (left-branch set)))
	((> x (entry set))
	 (element-of-set?
	  x
	  (left-branch set)))))

(define (list->tree elements)
  (car (partial-tree
	elements (length elements))))


