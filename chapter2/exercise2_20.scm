;;;; Same parity arbitrary length procedure

(define (same? x y)
  (or (and (even? x) (even? y)) (and (odd? x) (odd? y))))

(define (same-parity x . i)
  (display x)
  (display i))

