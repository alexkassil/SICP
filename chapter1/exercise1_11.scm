(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3))))

(define (f3-recursive n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

(define (f3-iter a b c count)
  (if (= count 0)
      c
      (f3-iter (+ a b c) a b (- count 1))))

(define (f3 n)
  (f3-iter 2 1 0 n))

(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* b 2) (* c 3)) a b (- count 1))))
