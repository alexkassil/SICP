;;;; Horner's rule

;; Solves any polynomial at point x
;; list is coefficients given in order x^0, x^1, ...
(define (solve list x)
  (if (null? (cdr list))
      (car list)
      (+ (car list) (* x (solve (cdr list) x)))))

;;; Horner's rule using accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

(define 
  (horner-eval x coeff-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coeff-sequence))