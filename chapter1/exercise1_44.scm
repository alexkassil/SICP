
(define (repeated f times)
  (if (< times 1)
      (lambda (x) x)
      (compose f (repeated f (- times 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (smooth f)
  (lambda (x)
    (average3 (f (- x dx)) (f x) (f (+ x dx)))))

(define (average3 x y z)
  (/ (+ x y z) 3))

(define (n-fold f n)
  ((repeated smooth n) f))