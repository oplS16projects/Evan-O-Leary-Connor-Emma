#lang slideshow
(require slideshow)
(require pict images/icons/control images/icons/style)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Information-Presented-Graphically-Using-Racket

;;Team C.E. Graphics

;;Evan O'Leary & Connor Emma
;;OPL Spring 2016 Final Project

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;NOTES:

;;
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;SLIDE COMMANDS:

;;
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(current-font-size 28)
(current-main-font "Helvetica")


(current-title-color "White")
(current-titlet (lambda (s)
                  (colorize (text s (current-main-font) 30)
                            (current-title-color))))

;;;;;------------------------------slide assembly--------------------------;;;;;





;;;;;----------------------------------------------------------------------;;;;;

(define background-image (make-parameter #f))
(define (background-image-pict)
   (define bg (background-image))
   (inset (scale bg (/ 1024 (pict-width bg)) (/ 768 (pict-height bg)))
          (- margin)))

;; Slide number parameters
(define slide-number (make-parameter 0))
(define (add1-slide-number) (slide-number (add1 (slide-number))))
(define format-slide-number
   (make-parameter
    (lambda (num)
      (scale (rt (number->string (slide-number))) 3/5))))

(define (add-slide bg-pct pct)
   (refocus (ct-superimpose bg-pct pct) bg-pct))

(define (add-slide-number pct)
   (refocus
    (rb-superimpose pct ((format-slide-number) (slide-number)))
    pct))

(current-slide-assembler
  (let ([orig  (current-slide-assembler)])
    (lambda (title sep body)
      (let* ([pct  (if (background-image)
                       (background-image-pict)
                       (inset (blank 1024 768) (- margin)))]
             [pct  (add-slide pct (orig title sep body))]
             [pct  (if (slide-number) (add-slide-number pct) pct)])
        pct))))

<<<<<<< HEAD
;(define audiopath "Aurora.wav")

(define (run)
 (slide-number 1)
  (background-image (bitmap "background.png"))
  (slide
   #:title "HISTORY OF SPACE EXPLORATION"
   #:timeout 10
   (inset (scale (bitmap "history_of_space_flight.png") (/ 1024 (pict-width (bitmap "history_of_space_flight.png"))) (/ 768 (pict-height (bitmap "history_of_space_flight.png") ))) (- margin)))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "WHAT IS SPACE EXPLORATION"
   #:timeout 10 #:gap-size 12
   (para #:width 900 #:fill? #t (tt "Space Exploration") "is the ongoing discovery and exploration of celestial structures in outer space by means of continuously evolving and growing space technology. The study of space is carried out by the following means:")

   (t " ")

   (lt-superimpose
    (hc-append
     (para #:align 'left #:fill? #t #:width 470 "        ")
     (bitmap "hubble_telescope_repair.png"))

    (vl-append (item #:bullet (bitmap (arrowhead 20 0)) "Astronomers with telescopes")
               (vl-append
                (vl-append (item #:bullet (bitmap (arrowhead 20 0)) "Human space flight")
                           (item #:bullet (bitmap (arrowhead 20 0)) "Robotic probes"))))))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "SPUTNIK I SKIMS THE SKY"
   #:timeout 10
   (para #:width 900 #:fill? #t "The Soviet Union launched Sputnik I Satellite 1 on October 4, 1957. Sputnik I orbited Earth at a height of around 160 miles. Two radio transmitters sent beeps at 20 and 40 MHz.")

   (t " ")

    (hc-append (bitmap "Sputnik_I.png")
               (vl-append (item #:bullet (bitmap (arrowhead 20 0)) #:align 'left #:fill? #t #:width 500 "Analysis of the radio signals provided information about the ionosphere")
                          (vl-append (item #:bullet (bitmap (arrowhead 20 0)) #:align 'left #:fill? #t #:width 500 "Duration of the beeps reported temperature and pressure")))))
  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "MAN REACHES SPACE"
   #:timeout 10
   (para #:width 900 "On April 12, 1961 the first successful human spaceflight was Vostok I East 1, carrying 27 year old cosmonaut Yuri Gagarin. The flight made one orbit around Earth lasting about 1 hour and 48 minutes.")
   (t " ")
   (bitmap "Yuri_Gagarin.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "THE DARK SIDE OF THE MOON"
   #:timeout 10
   (bitmap "earthrise.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "MAN WALKS ON THE MOON"
   #:timeout 10
   (lt-superimpose
    (hc-append
    ; (para #:align 'left#:fill? #t #:width 470 "     ")
     (vl-append (vl-append (t " ") (t " ")) (bitmap "neil_and_buzz_on_moon.png")))
    (vl-append )))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "HOUSTON WE HAVE A PROBLEM"
   #:timeout 10
   (bitmap "apollo_13_damage.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "HUBBLE GOES OPERATIONAL"
   #:timeout 10
   (para #:width 900 "The Hubble Space Telescope became the first observatory placed in space in 1990. The advantages of a telescope in space are a lack of dust and clouds, therefore many powerful images have been produced by the Hubble.")
   (t " ")
   (bitmap "Hubble_space_telescope.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "INTERNATIONAL SPACE STATION COMPLETED"
   #:timeout 10
   (bitmap "International_Space_Station.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "FIRST ORBITING OF AN ASTEROID" 
   #:timeout 10
   (bitmap "eros.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "FARTHEST EVER PICTURE OF THE UNIVERSE"
   #:timeout 10
   (para #:width 900 "The image, dubbed eXtreme Deep Field, is comprised of 10 years worth of photos taken by the Hubble space telescope. The photo depicts thousands of galaxies that are light years away.")
   (t " ")
   (bitmap "eXtreme_Deep_Field.png"))

  (add1-slide-number)
  (background-image (bitmap "background.png"))
  (slide
   #:title "THE FUTURE OF SPACE EXPLORATION"
   #:timeout 10
   (bitmap "space_launch_system.png"))

  )


=======
;(define audiopath "Aurora.wav")
>>>>>>> a80b7b77b2f0bb6a4021fafac1a3e37ce6397285
