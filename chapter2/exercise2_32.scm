;;;; Set of all subsets of the set

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map <??> rest))))))