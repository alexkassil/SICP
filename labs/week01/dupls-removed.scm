(define (dupls-removed s)
  (if (empty? s)
	  '()
	  (if (member? (first s) (bf s))
		  (se (dupls-removed (bf s)))
		  (se (first s) (dupls-removed (bf s))))))
	  
