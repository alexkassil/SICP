;;;; Set as binary tree

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (make-leaf entry)
  (list entry '() '()))

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree
	  (entry set)
	  (adjoin-set x (left-branch set))
	  (right-branch set)))
	((> x (entry set))
	 (make-tree
	  (entry set)
	  (left-branch set)
	  (adjoin-set x (right-branch set))))))
;;; Tree ways to represent the set {1, 3, 5, 7, 9, 11}

(make-tree 7 
	   (make-tree 3 
		      (make-leaf 1) 
		      (make-leaf 5)) 
	   (make-tree 9 '() (make-leaf 11)))
;;     7
;;   /   \
;;  3     9
;; / \     \
;;1   5     11

(make-tree 3 
	   (make-leaf 1)
	   (make-tree 7 (make-leaf 5)
		      (make-tree 9 '() (make-leaf 11))))
;;   3
;;  / \
;; 1   7
;;    / \
;;   5   9
;;        \
;;        11

(make-tree 5 (make-tree 3 
			(make-leaf 1) '()) 
	   (make-tree 9 (make-leaf 7) (make-leaf 11)))
;;    5
;;   / \
;;  3   9
;; /   / \
;;1   7  11

;;; Unbalanced tree 1-4 list
(make-tree 1 '() (make-tree 2 '() 
			    (make-tree 3 '() (make-tree 4 '() '())))) 
;; 1-2-3-4


