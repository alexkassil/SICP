;;;; Binary mobile

(define (make-mobile left right)
  (list left right))

;; Branch constructor from
;; length (number) and
;; structure (number (representing a weight) or anothor mobile)

(define (make-branch length structure)
  (list length structure))

;;; Selectors

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; Total weight procudure
;; Sum of all weights at the end of branches

(define (total-weight mobile)
  (cond ((not (pair? mobile)) mobile)
	(else (+ (total-weight (branch-structure (left-branch mobile)))
		 (total-weight (branch-structure (right-branch mobile)))))))

;; Balance check
;; Returns true if all torques at each mobile are balanced

(define (is-mobile? mobile)
  (pair? mobile))

(define (torque branch)
  (* (total-weight (branch-structure branch)) (branch-length branch)))

(define (balanced? mobile)
  (let* ((left (left-branch mobile))
	(right (right-branch mobile))
	(left-struct (branch-structure left))
	(right-struct (branch-structure right)))
    (cond ((not (= (torque right) (torque left))) #f)
	  ((is-mobile? left-struct) (balanced? left-struct))
	  ((is-mobile? right-struct) (balanced? right-struct))
	  (else #t))))
