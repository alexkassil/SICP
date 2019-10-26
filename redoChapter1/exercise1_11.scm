;; Recursive f

(define (f-recurse n)
  (if (< n 3) 
      n
      (+ (f-recurse (- n 1)) (* 2 (f-recurse (- n 2))) (* 3 (f-recurse (- n 3))))))

(f-recurse 0)
; 0
(f-recurse 1)
; 1
(f-recurse 2)
; 2
(f-recurse 3)
; 4
(f-recurse 4)
; 11
(f-recurse 5)
; 25
(f-recurse 6)
; 59
(f-recurse 25)
; 812934961

(define (f-iter n)
  (define (f n1 n2 n3 counter)
    (if (= counter n)
	n1
	(f n2 n3 (+ n3 (* 2 n2) (* 3 n1)) (+ counter 1))))
  (f 0 1 2 0))

(f-iter 0)
; 0
(f-iter 1)
; 1
(f-iter 2)
; 2
(f-iter 3)
; 4
(f-iter 4)
; 11
(f-iter 5)
; 25
(f-iter 6)
; 59
(f-iter 25)
; 812934961
(f-iter 100000)


