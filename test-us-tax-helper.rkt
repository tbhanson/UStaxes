#lang racket

(require rackunit "us-tax-helper.rkt")


; claim we have values for years 2011 - 2019

(for ([year (in-range 2011 2020)])
  (begin
    (check-equal?
     (real?
      (dollars-per-euro-by-year year))
     #t)
    (check-equal?
     (real?
      (euros-per-dollar-by-year year))
     #t)))
    

; now check one of these values (collected 2020) against one I used in the past
;
;(define (abs-diff x y)  (abs (- x y)))
(define epsilon 0.001)

; from my notes:
; 2011 avg exchange rate: 0.7188
(check-= 0.7188 (euros-per-dollar-by-year 2011) epsilon)
         
  
