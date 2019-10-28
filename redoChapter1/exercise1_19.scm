(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
		   (+ (* q q) (* p p))
		   (+ (* q p) (* q (+ q p)))
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))


(fib 8)
(fib 10000000)
; p = 0 q = 1
; a = bq + aq + ap -> a = b + a
; b = bp + aq      -> b = a
;|1 1| 3 
;|1 0| 2

; p = 1 q = 1
;|1 1| |1 1| -> |2 1| a = 1a + 1b + 1a
;|1 0| |1 0| -> |1 1| b = 1a + 1b

; p = 2 q = 3
;|2 1| |2 1| -> |5 3| a = 3a + 3b + 2a
;|1 1| |1 1| -> |3 2| b = 3a + 2b

; p = 13 q = 21
;|5 3| |5 3| -> |34 21| a = 21a + 21b + 13a
;|3 2| |3 2| -> |21 13| b = 21a + 13b

;|(p+q) q| |(p+q) q| -> |(p+q)^2 + q^2 q(p+q) + qp|
;|q     p| |q     p| -> |q(p+q) + qp   pp+qq      |







