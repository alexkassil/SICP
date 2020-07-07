(define (sequence-sum term next a b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sequence-sum term next (next a) b))))

(