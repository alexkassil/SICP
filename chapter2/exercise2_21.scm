;;;; Sqaure list 2 ways

(define nil ())

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
	    (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define (map f items)
  (if (null? items)
      nil
      (cons (f (car items))
	    (map f (cdr items)))))
