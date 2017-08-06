;;;; substitute - a function that changes every instance
;;;; of word 'old' with word 'new' in sentence 's'

(define (substitute s old new)
  (cond ((empty? s) '())
		((equal? (first s) old)
		 (se new (substitute (bf s) old new)))
		(else
		 (se (first s) (substitute (bf s) old new)))))
