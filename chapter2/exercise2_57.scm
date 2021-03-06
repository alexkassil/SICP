;;;; Exercise 2.57 sums and products of many terms

(define (deriv exp var)
  (cond ((number? exp) 0) ; Returns 0 when constant
	((variable? exp)
	 ; Returns 1 when dx/dx, returns 0 when variable other than x
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 ;d(u+v)/dx = du/dx + dv/dx
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 ;d(uv)/dx = u(dv/dx) + v(du/dx)
	 (make-sum
	  (make-product
	   (multiplier exp)
	   (deriv (multiplicand exp) var))
	  (make-product
	   (deriv (multiplier exp) var)
	   (multiplicand exp))))
	((exponentiation? exp)
	 (make-product
	  (exponent exp)
	  (make-exponentiation
	   (base exp)
	   (- (exponent exp) 1))))
	(else (error "unkown expression type: DERIV" exp))))


;;; Lisp notation for functions
;;; ax + b = (+ (* a x) b)

;;; Selectors, constructors, and predicates

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
	((=number? exponent 1) base)
	((and (number? base) (number? exponent)) (expt base exponent))
	(else (list '** base exponent))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
  (and (pair? x)
       (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (if (= (length (cddr s)) 1)
      (caddr s)
      (append (list '+) (cddr s))))

(define (product? x)
  (and (pair? x)
       (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p)
  (if (= (length (cddr p)) 1)
      (caddr p)
      (append (list '*) (cddr p))))

(define (exponentiation? x)
  (and (pair? x)
       (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))
















