(define (pascal x y)
  (cond ((= x 1) 1)
	((= y 1) 1)
	((= y x) 1)
	(else (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))))

(pascal 1 1)

(pascal 2 2)

(pascal 3 2)

(pascal 5 3)

(pascal 5 2)

(pascal 5 4)

(define (display-pascal n)
  (define (display-row start end)
    (display (pascal end start))
    (display " ")
    (if (= start end)
	(newline)
	(display-row (+ start 1) end)))
  (define (display-spaces n)
    (cond ((not (= n 0)) (display " ") (display-spaces (- n 1)))))
  (define (display-iter i)
    (display-spaces (- n i))
    (display-row 1 i)
    (if (= n i)
	(newline)
	(display-iter (+ i 1))))
  (display-iter 1))

(display-pascal 5)
