(define (double x)
  (+ x x))

(define (even? n)
  (= (remainder n 2) 0))


(define (* a b)
  (define (t a b c)
    (display a)
    (display " ")
    (display b)
    (display " ")
    (display c)
    (newline)
    (cond ((= b 0) c)
	  ((even? b) (t (double a) (/ b 2) c)))
	  (else (t a (- b 1) (+ c a))))))
  (t a b 1))

(* 2 8)
(* 2 7)
(* 2 6)
