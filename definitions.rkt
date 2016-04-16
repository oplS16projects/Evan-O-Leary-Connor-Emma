#lang slideshow

;object which holds a list of slides in the slideshow and the number of slides in the list
;(define (slideshow-interface slides num-slides)
;  )

; A way of generalizing slides by their slide number
(define (slide-n n) (slide #:title "User Generated Slide" (item "Slide number: "(number->string n)))) 

(define (make-slideshow num-slides)
(define slides (list))
  (define (iter i numslides slidelist)
         (if (> i num-slides)
             '()
            (iter (+ i 1) numslides (cons (slide-n i) slides))))
  (iter 1 num-slides slides))
  
  
  