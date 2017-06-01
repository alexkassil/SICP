;;;; Double single quote
;;;; Explanation of why (car ''abracadabra) prints back quote

;; Well, for starters one quote of abracadabra, 'abracadabra, would turn into
;; (quote abracadabra) and return (abracadabra), so when car'd it would return
;; abracadabra. But ''abracadabra turns into '(quote abracadabra) which turns into
;; (quote (quote abracadabra)) and returns (quote abracadabra), so when car'd returns
;; quote.