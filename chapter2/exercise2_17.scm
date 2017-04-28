;;;; Last pair of nonempty list

;; Determines length of list
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;; Returns list that has the first n entries removed
(define (sublist l n)
  (if (= n 0)
      l
      (sublist (cdr l) (- n 1))))

;; Returns last pair of list 
(define (last-pair l)
  (sublist l (- (length l) 1)))
