#lang slideshow

;(define picture1 (bitmap "C:\\Users\\Connor\\Pictures\\artsyspace.jpg"))
(define picture1 (bitmap "C:\\Users\\Connor\\Pictures\\artsy-space-small.jpg"))
  
(define slide1 (slide
  #:title "An Updated Look at Space Exploration"
  (rt "Evan O'Leary | Connor Emma" )))
(define slide2 (slide
  #:title (bit "A Brief Overview of Modern Space Technology")
  (item #:fill? #t
        (t "Most research done using telescopes, drones, probes"))
  (item #:fill? #t
        (t "Major contributors,: NASA, China, Russia"))))
(define slide3 (slide
  (para  700 'center picture1
        (t "Autonomed technologies would be able to perform beyond predetermined actions. It would analyze all possible states and events happening around them and come up with a safe response. In addition, such technologies can reduce launch cost and ground involvement. Performance would increase as well. Autonomy would be able to quickly respond upon encountering an unforeseen event, especially in deep space exploration where communication back to Earth would take too long.["))))

;(define (make-media-slide media arguments ... )
 ; (lambda 