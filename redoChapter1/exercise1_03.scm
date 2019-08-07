(define (sumSquareLargerTwo a b c)
  (cond ((and (< a b) (< a c)) 
	 (+ (* b b) (* c c)))
	((and (< b a) (< b c))
	 (+ (* a a) (* c c)))
	(else (+ (* a a) (* b b)))))

(sumSquareLargerTwo 1 2 3)
; 13
(sumSquareLargerTwo 1 3 2)
; 13
(sumSquareLargerTwo 2 1 3)
; 13
(sumSquareLargerTwo 2 3 1)
; 13
(sumSquareLargerTwo 3 1 2)
; 13
(sumSquareLargerTwo 3 2 1)
; 13
(sumSquareLargerTwo 2 2 2)
; 8
