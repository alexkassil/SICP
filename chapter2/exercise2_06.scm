;;;; Church numerals

(define zero
  (lambda (f)
    (lambda (x)
      x)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((b f) ((a f) x)))))

(define (multiply a b)
  (lambda (z) (a (b z))))

