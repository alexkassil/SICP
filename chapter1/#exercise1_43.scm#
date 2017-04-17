;;;; repeated returns takes f(x) and returns f(f(f(...(f(x))))) times timeso

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  (if (= times 1)
      (lambda (x)
	(f x))
      (compose f (repeated f (- times 1)))))





