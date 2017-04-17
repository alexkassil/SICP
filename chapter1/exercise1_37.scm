;;;; Continued Fractions

;; Finds the k-term finite continued fraction

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   k)

(define (cont-frac N D k)
  (if (= k 0)
      (/ (N k) (D k))
      (/ (N k) (+ (D k)
		  (cont-frac N D (- k 1))))))

; Approximates phi to 4 decimal places (1.6180)
(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   9)
