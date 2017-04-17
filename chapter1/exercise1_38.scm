;;;; e;;;; e approximation with continued fractions

(define (cont-frac N D k)
  (define (cont-frac-counter i k)
    (if (= k 0)
	(/ (N i) (D i))
	(/ (N i) (+ (D i)
		    (cont-frac-counter (+ i 1) (- k 1))))))
  (cont-frac-counter 0 k))

;; e 

(+ 2 (cont-frac (lambda (i) 1.0)
	   (lambda (i)
	     (if (= 1 (modulo i 3))
		 (* 2 (/ (+ i 2) 3))
		 1.0))
	   1000))

(+ 2 (cont-frac (lambda (i) 1.0)
		    (lambda (i) 
		      (if (= 2 (modulo i 3))
			  (* (/ (+ i 1) 3) 2)
			  1.0))))

