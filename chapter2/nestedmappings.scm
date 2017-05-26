;;;; Extending the sequence paradigm to include many computations
;;;; commonly expressed using nested loops

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate
		       (cdr sequence))))
	(else (filter predicate
		      (cdr sequence)))))

(define (prime? n)
  (let loop ((d 2))
    (cond ((< n (* d d)) #t)
          ((zero? (modulo n d)) #f)
          (else (loop (+ d 1))))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ low 1)
	    high))))

(define (generate-pairs n)
  (accumulate
   append
   '()
   (map (lambda (i)
	  (map (lambda (j)
		 (list i j))
	       (enumerate-interval 1 (- i 1))))
	(enumerate-interval 1 n))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
	(cadr pair)
	(+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
	prime-sum?
	(generate-pairs n))))
	 