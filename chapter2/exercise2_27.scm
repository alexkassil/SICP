;;;; Deep reverse

(define (reverse l)
  (define (reverse-iter given new)
    (display new)
    (newline)
    (cond ((null? given) new)
	  ((not (pair? given)) (list given))
	  (else (reverse-iter (cdr given)
			      (append (reverse-iter (car given) new) new)))))
  (reverse-iter l (list)))







