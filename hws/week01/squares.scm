;;;; Map square over a list
(define (squares s)
  (if (empty? s)
	  '()
	  (se (square (first s))
		  (squares (bf s)))))

(define (square x)
  (* x x))
