;;;; Generalize doing an operation on every member

(define (every f s)
  (if (empty? s)
	  '()
	  (se (f (first s))
		  (every f (bf s)))))

;;; Sqaure every number

(define (squares s)
  (if (empty? s)
	  '()
	  (se (square (first s))
		  (squares (bf s)))))

(define (square x)
  (* x x))

;;; Turn every word into Pig Latin

(define (pigl-sent s)
  (if (empty? s)
	  '()
	  (se (pigl (first s))
		  (pigl-sent (bf s)))))


(define (pigl wd)
  (if (pl-done? wd)
	  (word wd 'ay)
	  (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter 'aeiou))
