;;;; Is or a special forms?

;; If (or (= x 0) (= y 0) (= z 0)) is evaluated,
;; does or evaluate in a specific order, stopping
;; as soon as a true value is hit, or does or work
;; in an applicative order, evaluating all, and then
;; returning its value?

(define (x)
  (print 'x)
  #f)

(define (y)
  (print 'y)
  #t)

(define (z)
  (print 'z)
  #t)

(or (x) (y) (z))

;; From this experiment, it is evident this scheme's
;; implementation of or is a special form, since the
;; or operands are evaluated from left to right,
;; stopping as soon as one true value is returned from
;; an operand

;; One advantage of having or be a special form is short
;; circuiting, where the programmer know the later
;; operands will only be evaluated if the earlier ones
;; are false. Then you can right more efficient programs
;; where the more expensive functions are later in the
;; or statement and only called when all previous
;; operands return false

;; One advantage of having or not be a special form is
;; knowing that all operands will always be evaluated,
;; so any failures with later operands will be caught
;; sooner since it's always evaluated with each or call
