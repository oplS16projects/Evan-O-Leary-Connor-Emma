#lang slideshow
(require slideshow)
(require pict images/icons/control images/icons/style)

(require (only-in racket/gui/base play-sound))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Information-Presented-Graphically-Using-Racket

;;Team C.E. Graphics

;;Evan O'Leary & Connor Emma
;;OPL Spring 2016 Final Project

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;NOTES:

;; To quickly run through our slides and get an idea of our presentation change
;; the timeout under each slide to 2.

;; EXAMPLE (Changing the first slide's timeout):
;; (slide
;;  #:title "HISTORY OF SPACE EXPLORATION"
;;  #:timeout 2 <----------------------------- timeout parameter to change 
;;  (bitmap "history_of_space_flight.png"))

;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;SLIDE COMMANDS:

;;;; Exiting:

;; Must confirm by hitting "Quit" in the gui alert box     
;;
;; Alt-q, Meta-q, or Cmd-q:     end slide show
;; Esc:                         end slide show

;;;; Navigation:   
;;                
;; 1 (one):     first slide
;; g      :     last slide 
;; s      :     next slide
;; a      :     previous slide

;;;; Specific Navigation/ Hide Slide Number
;;
;; Alt-g, Cmd-g, or Meta-g:     select a slide
;; Alt-p, Cmd-p, or Meta-p:     show/hide slide number
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(current-font-size 28)
(current-main-font "Helvetica")
;(current-main-font-color "White")

(define (make-white slide) (colorize slide "White"))

(current-title-color "White")
(current-titlet (lambda (s)
                  (colorize (text s (cons 'bold (current-main-font)) 40)
                            (current-title-color))))

;;;;;------------------------------slide assembly--------------------------;;;;;

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

;;;;;----------------------------------------------------------------------;;;;;

(background-image (bitmap "background.png"))

(thread (lambda () (let loop () (play-sound "Aurora.wav" #f) (loop))))

(define (run)
  ;(thread (lambda () (let loop () (play-sound "Aurora.wav" #f) (loop))))
  
  (slide-number 1)
  (slide
   #:title "HISTORY OF SPACE EXPLORATION"
   #:timeout 7
   (bitmap "history_of_space_flight.png"))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "WHAT IS SPACE EXPLORATION"
   #:timeout 5 ;#:timeout 15 #:gap-size 12
   (make-white(para #:width 900 #:fill? #t (bt "Space Exploration") "is the ongoing discovery and exploration of celestial structures in outer space by means of continuously evolving and growing space technology. The study of space is carried out by the following means:"))

   (t " ")

   (lt-superimpose
    (hc-append
     (para #:align 'left #:fill? #t #:width 480 "        ")
     (bitmap "hubble_telescope_repair.png"))

    (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Astronomers with telescopes")
               (vl-append
                (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Human space flight")
                           (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Robotic probes")))))))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "SPUTNIK I SKIMS THE SKY"
   #:timeout 5 ;#:timeout 20 #:gap-size 12
   (make-white (para #:width 900 #:fill? #t "The Soviet Union launched Sputnik I (\"Satellite 1\") on October 4, 1957. Sputnik I orbited Earth at a height of around 160 miles. Two radio transmitters sent beeps at 20 and 40 MHz."))

   (t " ")

    (hc-append (bitmap "Sputnik_I.png")
               (make-white(vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 480 "Analysis of the radio signals provided information about the ionosphere")
                          (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 480 "Duration of the beeps reported temperature and pressure"))))))
  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "MAN REACHES SPACE"
   #:timeout 5 ;#:timeout 15 #:gap-size 12
   (make-white (para #:width 900 "On April 12, 1961 the first successful human spaceflight was Vostok I (\"East 1\"), carrying 27 year old cosmonaut Yuri Gagarin. The flight made one orbit around Earth lasting about 1 hour and 48 minutes."))
   (t " ")
   (bitmap "Yuri_Gagarin.png"))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "THE DARK SIDE OF THE MOON"
   #:timeout 5 ;#:timeout 25 #:gap-size 12
   (make-white (para #:width 900 #:fill? #t "On December 21, 1968 Apollo 8, NASA's second manned space mission launched. It orbited the moon 10 times in 20 hours and was the first spacecraft to leave Earth's orbit, orbit the moon, and return safely home. The three astronauts Frank Bowman, James Lovell, and William Anders were the first to:"))

   (t " ")

    (hc-append (bitmap "earthrise.png")
               (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 480 "See the far side of the moon not visible from Earth's surface")
                          (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 480 "See Earth as a whole planet"))))))


  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "MAN WALKS ON THE MOON"
   #:timeout 5 ;#:timeout 17 #:gap-size 12
   (lt-superimpose
    (hc-append
     (para #:align 'left #:fill? #t #:width 500 "        ")
     (bitmap "neil_and_buzz_on_moon.png"))

    (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:width 480 (bt "July 21, 1969: ") "Neil Armstrong and Buzz Aldrin became the first humans to step foot on another celestial body, the moon")
               (vl-append
                (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:width 480 "They spent about 2 hours and 30 minutes on the moon")))))))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "HOUSTON WE HAVE A PROBLEM"
   #:timeout 5 ;#:timeout 20 #:gap-size 12
   (make-white (para #:width 900 #:fill? #t "The famous words “Houston we have a problem.” were uttered on the 1970 Apollo 13 mission. The mission was aborted due to an oxygen tank that exploded 2 days into the mission. Apollo 13 was intended to be the third manned mission to the moon. Astronauts James Lovell, John Swigert, and Fred Haise overcame:"))

   (t " ")

   (lt-superimpose
    (hc-append
     (para #:align 'left #:fill? #t #:width 500 "        ")
     (bitmap "apollo_13_damage.png"))

    (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Loss of power")
               (make-white (vl-append
                (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Loss of cabin heat")
                           (item #:bullet (bitmap (make-white (arrowhead 20 0))) "Shortage of water"))))))))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "HUBBLE GOES OPERATIONAL"
   #:timeout 5 ;#:timeout 16 #:gap-size 12
   (make-white (para #:width 900 "The Hubble Space Telescope became the first observatory placed in space in 1990. The advantages of a telescope in space are a lack of dust and clouds, therefore many powerful images have been produced by the Hubble."))
   (t " ")
   (bitmap "Hubble_space_telescope.png"))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "INTERNATIONAL SPACE STATION COMPLETED"
   #:timeout 5 ;#:timeout 20 #:gap-size 12
   (lt-superimpose
    (hc-append
     (para #:align 'left #:fill? #t #:width 500 "        ")
     (bitmap "International_Space_Station.png"))

    (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:width 480 (bt "1998: ") "The first pieces of the International Space Station (ISS) were launched")
               (vl-append
                (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:width 480 (bt "Since 2001: ") "A crew of either 2 or 6 have been aboard the ISS at all times")
                           (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:width 480 "The ISS is the larget artifical body in orbit and can be viewed with the naked eye under the right conditions"))))))))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "FIRST ORBITING OF AN ASTEROID" 
   #:timeout 5 ;#:timeout 25 #:gap-size 12
    (make-white (para #:width 900 #:fill? #t "NEAR-Shoemaker was a NASA mission designed to orbit an asteroid. The asteroid NEAR was to orbit was Eros, a large near Earth asteroid, and return data on composition, mineralogy, morphology, and magnetic field to answer questions about these asteroids. Important dates of the mission are:"))

   (t " ")

    (hc-append (bitmap "eros.png")
               (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 500 (bt "February 4,1996: ") "Launched")
                          (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 500 (bt "February 16, 2000: ") "Orbit around Eros")
                                     (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 500 (bt "February 28, 2001: ") "Landed on Eros and sent last signal"))))))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "FARTHEST EVER PICTURE OF THE UNIVERSE"
   #:timeout 5 ;#:timeout 12 #:gap-size 12
   (make-white (para #:width 900 "The image, dubbed eXtreme Deep Field, is comprised of 10 years worth of photos taken by the Hubble space telescope. The photo depicts thousands of galaxies that are light years away."))
   (t " ")
   (bitmap "eXtreme_Deep_Field.png"))

  (add1-slide-number)
  ;(background-image (bitmap "background.png"))
  (slide
   #:title "THE FUTURE OF SPACE EXPLORATION"
   #:timeout 5 ;#:timeout 12 #:gap-size 12
   (make-white (para #:width 900 #:fill? #t "The future of space exploration will be funded by both private investors and traditional governments. Some of the goals stated are:"))

   (t " ")

    (hc-append (bitmap "space_launch_system.png")
               (make-white (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 500 (bt "China: ") "Launch a 60 ton multi-module space station into orbit by 2020")
                          (vl-append (item #:bullet (bitmap (make-white (arrowhead 20 0))) #:align 'left #:fill? #t #:width 500 (bt "NASA: ") "Develop the space launch system (SLS) for space exploration beyond Earth's orbit"))))))
  )


