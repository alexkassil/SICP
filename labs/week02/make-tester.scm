
(define (make-tester w)
  (lambda (x)
	(equal? x w)))


((make-tester 'hal) 'hal)

((make-tester 'hal) 'cs61a)

(define sicp-author? (make-tester 'gerry))
(sicp-author? 'hal)

(sicp-author? 'gerry)
