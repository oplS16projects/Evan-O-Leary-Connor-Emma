# Information Presented Graphically Using Racket

## Authors

 *Evan O'Leary @olearyevan*
 
 *Connor Emma @connoremma*

## Overview
Our project is a demonstration of using functional programming practices to construct robust presentation slides using rich text and media, and is also visually pleasing and plausible to an audience. 

![alt-text](http://i.imgur.com/fcmqeNZ.png)

![alt-text](http://i.imgur.com/QPjiLFV.png)

## Concepts Demonstrated

  * **Symbolic language processing** and **Message passing based object oriented programming**
   - Cons cells of symbols and objects allow other procedures to have fine grained control over the interface using a sort of "dispatch" style procedure.
  * **Anonymous functions and data abstraction**
   - High level generalization of objects with procedures mapped to them create a repeatable programming fashion which is important for a tool such as a slideshow.

## External Technology and Libraries

  * **Racket Slideshow:** an implementation of racket gui used to create and generalize a set of presentation slides.
   - http://docs.racket-lang.org/slideshow/
  * **Pict images/icons/control images/icons/style:** Member functions from the pict library used to resize, recolor, and stylize text and images in the form of pict objects.
   - https://docs.racket-lang.org/pict/
  * **racket/gui/base play-sound:** Racket GUI's implementation of outputting sound. Used for background music for our presentation.
   - https://docs.racket-lang.org/gui

## Favorite Scheme Expressions

### Connor 

My favorite scheme expression from our final project is this procedure `(current-titlet)` that accepts a procedure as its argument. That expression is evaluated at a high level in an effort to generalize some preliminary settings for our slideshow. For each `title` object that is recieved by this anonymous expression, it is colorized and stylized using message passing object oriented programming.

```
(current-titlet (lambda (s)
                  (colorize (text s (cons 'bold (current-main-font)) 40)
                            (current-title-color))))
```
 
### Evan

This is a simple method of data abstraction for colorizing pict elements that we created. Though this code is simple, this line is my personal favorite because it represents a large obstacle that we had to surpass in order to get closer to what our vision of the presentation looked like, and because documentation was so limited, we spent much time looking at each return value for procedures and object types that were in additional dependencies. One of our original goals was to make a *visually pleasing* slideshow presentation, and without this piece of code that could not have happened. 

```
(define (make-color slide) (colorize slide "White"))
```

## Additional Remarks 

Ultimately, we are proud of how the final project turned out. At a first glance, the project seemed like nothing more than copying and pasting a few API functions from a racket library and having our entire project be generated automatically. And there was good reason to believe that at first because our in-class proposal was so high-level that we glazed over most of the technical aspects of what we intended to do. After a temporary remission, our project goals ended up doing a complete 360 and coming full circle, when we discovered ourselves pouring through limited documentation. 

https://lists.racket-lang.org/users/archive/2011-February/044148.html

We are extremely proud to say that through solving problems related to our project, we've in-turn found a solution for others experiencing the same problem as us, giving us a worthwhile sense of accomplishment for solving a non-trivial problem. 

### Note: 
  * Images and soundfiles must be in the same directory as the racket source file for the slideshow to display properly. 
  * Background song loops infinitely, the music will not stop until Dr. Racket is closed. 
  * Slides are timed automatically, and may be adjusted by editing the `#timeout:` parameter for each slide. This is explained again in the comments of our racket source. 
 
## How to Download and Run
  * Download the latest release from GitHub, making sure all images and sound files are in the same directory as the racket file (slides.rkt)
  * Run the program through Dr.Racket, ensuring all nessecary dependencies have been installed. 
  * Remember, music loops infinitely until you close Dr.Racket.
