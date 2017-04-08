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
(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))