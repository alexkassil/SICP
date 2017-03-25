(define (sqrt-iter guess x)
  (display (- (square (improve guess x)) x)) (newline)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (better-good-enough? guess x)
  (< (abs (- (square (improve guess x)) x)) 1.0e-8))

(define (better-sqrt-iter guess x)
  (display (- (square (improve guess x)) x)) (newline)
  (if (better-good-enough? guess x)
      guess
      (better-sqrt-iter (improve guess x)
		 x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 x))