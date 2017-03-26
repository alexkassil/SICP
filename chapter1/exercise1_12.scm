(define (p a b)
  (if (or (= b 1) (= a b))
      1
      (+ (p (- a 1) (- b 1)) (p (- a 1) b))))