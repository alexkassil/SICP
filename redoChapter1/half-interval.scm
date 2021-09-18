; Half interval method of finding a root of an equation f(x) = 0

; Start with a, b such that f(a) < 0 < f(b), then compute (a + b)/2 = c
; If f(c) > 0, recurse f(a) < 0 < f(c)
; if f(c) < 0, recurse f(c) < 0 < f(b)
; if f(c) is within tolerance of 0, return (a + b) / 2

(define (search f a b)
  (let ((c (/ (+ a b) 2.0))
	(tolerance .00001))
    (display a)
    (display " ")
    (display b)
    (display " ")
    (display c)
    (display " ")
    (display (f a))
    (display " ")
    (display (f b))
    (display " ")
    (display (f c))
    (display "\n")
    (cond ((> tolerance (abs (f c))) c)
	  ((> (f c) 0) (search f a c))
	  ((< (f c) 0) (search f c b)))))

(define (double x) (* 2 x))

(search double -5 100)
(define (f x) (+ (* x x -3)  (* 5 x) 7))

(search f 5 0)


(f .3722813232690143)
(f 5)

(search sin 4.0 2.0)
