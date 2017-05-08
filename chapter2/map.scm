;;;; Maps a procedure to a list

(define (map procedure items)
  (if (null? items)
      '()
      (cons (procedure (car items))
	    (map procedure (cdr items)))))

