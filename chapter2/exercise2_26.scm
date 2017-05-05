;;;; Append vs Cons vs List

(define x (list 1 2 3))
(define y (list 4 5 6))

(newline)
(display (append x y))
(newline)

(display (cons x y))
(newline)

(display (list x y))
(newline)