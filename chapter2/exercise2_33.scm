;;;; Basic list-manipulation as accumulations

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))


(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
	      nil sequence))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))