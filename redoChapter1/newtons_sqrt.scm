(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess x)
  (< (abs (- guess x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(improve 1 2)

(improve (improve 1 2) 2)

(improve (improve 1 2) 2)

(improve (improve (improve 1 2)  2) 2)

(define (sqrt-iter guess x)
  (display guess)
  (display)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (display x)
  (sqrt-iter 1 x))
  
(sqrt 4)


