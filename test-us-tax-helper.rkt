#lang racket

(require rackunit "us-tax-helper.rkt")


; claim we have values for years we care about

(for ([year (in-range 2011 2020)])
  (check-equal?
   (real?
    (euros-per-dollar-by-year year))
   #t))

(for ([year (in-range 2016 2023)])
  (check-equal?
   (real?
    (euros-per-dollar-by-year-per-irs year))
   #t))


; now check one of these values (collected 2020) against one I used in the past
(define epsilon 0.001)

; from my notes:
; 2011 avg exchange rate: 0.7188
(check-= 0.7188 (euros-per-dollar-by-year 2011) epsilon)
;(check-= 0.877 (euros-per-dollar-by-year 2020) epsilon)

;(check-= 0.846 (euros-per-dollar-by-year 2021) epsilon)


; curious about discrepancies based on source (i have 2 sources for 2016 - 2021)

;(stream->list (stream-map euros-per-dollar-by-year (in-range 2016 2021)))
;(stream->list (stream-map euros-per-dollar-by-year-per-irs (in-range 2016 2021)))

; cf. https://en.wikipedia.org/wiki/Symmetric_mean_absolute_percentage_error

(define (symmetric-relative-error m1 m2)
  (let ((numer (abs (- m1 m2)))
        (denom (+ (abs m1) (abs m2))))
    (/ numer denom)))

(stream->list
 (stream-map
  (lambda (year)
    (symmetric-relative-error
     (euros-per-dollar-by-year year)
     (euros-per-dollar-by-year-per-irs year)))
  (in-range 2016 2021)))
     