(define (switch s)
  (if (empty? s)
	  '()
	  (if (equal? (first s) 'you)
		  (se 'i (switch2 (bf s)))
		  (switch2 s))))

(define (switch2 s)
  (if (empty? s)
	  '()
	  (cond ((equal? (first s) 'you)
			 (se 'me (switch2 (bf s))))
			((or (equal? (first s) 'i) (equal? (first s) 'me))
			 (se 'you (switch2 (bf s))))
			(else
			 (se (first s) (switch2 (bf s)))))))
			 
			 
			
			
		   
