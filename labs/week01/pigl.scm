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
