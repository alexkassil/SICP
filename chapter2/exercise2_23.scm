;;;; For each

(define (for-each f items)
  (cond ((not (null? items)) (f (car items)) (for-each f (cdr items)))))
