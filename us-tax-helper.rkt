#lang racket

; source: https://www.ofx.com/en-au/forex-news/historical-exchange-rates/yearly-average-rates/
;Date (GMT) 	Rate**
;Average 	1.208677
;31 Dec 2011 	1.392705
;31 Dec 2012 	1.285697
;31 Dec 2013 	1.328464
;31 Dec 2014 	1.329165
;31 Dec 2015 	1.109729
;31 Dec 2016 	1.10656
;31 Dec 2017 	1.130051
;31 Dec 2018 	1.181011
;31 Dec 2019 	1.120129
;21 Mar 2020 	1.103255
;**1 UNIT of EUR = X UNITS of USD 

(define (dollars-per-euro-by-year year)
  (cond
    [(equal? year 2011) 1.392705]
    [(equal? year 2012) 1.285697]
    [(equal? year 2013) 1.328464]
    [(equal? year 2014) 1.329165]
    [(equal? year 2015) 1.109729]
    [(equal? year 2016) 1.106560]
    [(equal? year 2017) 1.130051]
    [(equal? year 2018) 1.181011]
    [(equal? year 2019) 1.120129]
    [(equal? year 2020) 1.103255]
        [else #f]))

(define (euros-per-dollar-by-year year)
  (/ 1.0 (dollars-per-euro-by-year year)))
  
(provide
 dollars-per-euro-by-year
 euros-per-dollar-by-year
 )
