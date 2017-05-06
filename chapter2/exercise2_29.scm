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
