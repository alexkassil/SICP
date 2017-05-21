;;;; Accumulate n

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (first seqs))
	    (accumulate-n op init (remove-first seqs)))))

;; Returns sequence filled with first element from each sequence

(define (first seqs)
  (if (null? seqs) '()
      (cons (car (car seqs)) (first (cdr seqs)))))

;; Removes first entry from each sequence

(define (remove-first seqs)
  (if (null? seqs) '()
      (cons (cdr (car seqs)) (remove-first (cdr seqs)))))

