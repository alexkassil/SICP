;; With applicative-behavior he will hang since infinite recursion
;; With normal-order, the (p) will never evaluate so 0 will be returned

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))


