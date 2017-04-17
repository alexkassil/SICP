;;;; Composition function. Takes f(x) and g(x), returns f(g(x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (inc x)
  (+ x 1))

; Returns 49
((compose square inc) 6)
