;;;; Rationals in scheme with cons, car, and cdr

;;; Constructors, getters, and displaying

;; Make a rational
(define (make-rat n d) (cons n d))

;; Get the numerator
(define (numer x) (car x))

;; Get the denominator
(define (denom x) (cdr x))

;; Print rational
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;;; Basic arithmatic

;; Addition
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

;; Subtraction
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

;; Multiplication
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

;; Division
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

;;; Other useful functions

;; Equality

(define (equal-rat? x y)
  (= (* (numer x) (denom y)) (* (numer y) (denom x))))
