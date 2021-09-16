(define (filtered-accumulate combiner null-value term a next b condition)
  (define (iter a result)
    (cond ((> a b) result)
	  ((condition a) (iter (next a) (combiner (term a) result)))
	  (else (iter (next a) result))))
  (iter a null-value))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) 
	   n)
	  ((divides? test-divisor n) 
	   test-divisor)
	  (else (find-divisor 
		 n 
		 (next test-divisor)))))
  (define (next divisor)
    (if (= divisor 2)
	3
	(+ divisor 2)))

  (define (divides? a b)
    (= (remainder b a) 0))

  (= n (smallest-divisor n)))


(define (prime-square-sum a b)
  (filtered-accumulate + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime?))

(prime-square-sum 1 2)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relatively-prime-product n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (lambda (i) (= (gcd i n) 1))))

(relatively-prime-product 9)
(* 1 2 4 5 7 8)

(define (totient n)
  (filtered-accumulate + 0 (lambda (x) 1) 1 (lambda (x) (+ x 1)) n (lambda (i) (= (gcd i n) 1))))

(totient 9)

(* (totient 9) (totient 10))

(totient 90)













