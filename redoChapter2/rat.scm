; Rational Numbers

;; (make-rat <n> <d>)
;; (numer <x>)
;; (denom <x>)

(define (make-rat n d)
  (lambda (y)
    (let ((g (gcd n d)))
	  (if y (/ n g) (/ d g)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer x)
  (x #t))

(define (denom x)
  (x #f))

;; Alternate constructor/selector definition

;;; (define make-rat cons)
;;; (define numer car)
;;; (define denom cdr)

(define one-half (make-rat 1 2))

(numer one-half)
(denom one-half)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(define seven-twelths (mul-rat (make-rat 7 1) (mul-rat one-half (mul-rat one-half one-third))))
(define twelve-sevenths (div-rat (make-rat 10 10) seven-twelths))

(print-rat one-half)
(print-rat one-third)
(print-rat seven-twelths)
(print-rat twelve-sevenths)









