;;;; Exercise 2.02 Midpoint of a line segment

;; Create a line segment

(define (make-segment start end)
  (cons start end))

;; Line segment getters
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; Create an (x, y) point

(define (make-point x y)
  (cons x y))

;; Point getters
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;;; Print functions

;; Print point

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

;; Print line segment

(define (print-line-segment l)
  (print-point (start-segment l))
  (display "->")
  (print-point (end-segment l)))

;; Midtpoint of line segment

(define (midpoint l)
  (make-point (/ (+ (x-point (start-segment l)) (x-point (end-segment l)))
		 2)
	      (/ (+ (y-point (start-segment l)) (y-point (end-segment l)))
		 2)))

