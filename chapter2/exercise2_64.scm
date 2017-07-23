;;;; List -> Tree partial

(define (list->tree elements)
  (car (partial-tree
	elements (length elements))))


