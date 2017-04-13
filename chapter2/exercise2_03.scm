;;;; Exercise 2.03 Two Rectangle Implementations

;;; Line Segments and Points

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

;;; Rectangle Implementation 1 - using line segments

;; Create Rectagle using two points

(define (make-rect1 p1 p2)
  (cons p1 p2))

;; Creat Rectangle using a point, length, and width

(define (make-rect2 p-top-left length width)
  (cons p-top-left (make-point (+ (x-point p-top-left) length)
			       (+ (y-point p-top-left) width))))

;;; Getters

(define (rect-p1 rect)
  (car rect))
(define (rect-p2 rect)
  (make-point (x-point (cdr rect)) (y-point (car rect))))
(define (rect-p3 rect)
  (cdr rect))
(define (rect-p4 rect)
  (make-point (x-point (car rect)) (y-point (cdr rect))))


;; Perimiter

(define (perim rect)
  (+ (* 2 (abs (- (x-point (rect-p1 rect)) (x-point (rect-p3 rect)))))
     (* 2 (abs (- (y-point (rect-p1 rect)) (y-point (rect-p3 rect)))))))

;; Area

(define (area rect)
  (* (abs (- (x-point (rect-p1 rect)) (x-point (rect-p3 rect))))
     (abs (- (y-point (rect-p1 rect)) (y-point (rect-p3 rect))))))







