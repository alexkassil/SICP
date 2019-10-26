;; This function return (a + abs(b)) by either doing a - b or a + b depending on b's sign

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -1)
; 2
(a-plus-abs-b 1 -1)
; 2


