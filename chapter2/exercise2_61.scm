;;;; Adjoin set on ordered set

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((= x (car set)) set)
	((< x (car set)) (cons x set))
	(else (cons (car set) (adjoin-set x (cdr set))))))

;;; Takes O(n), but twice as fast as adjoin-set on unorderd list since
;;; the algorithm doesn't traverse the whole list everytime, but stop
;;; when it finds its place