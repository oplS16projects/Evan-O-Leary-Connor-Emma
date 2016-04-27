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

Though this code is simple, this line is my personal favorite because it represents a large obstacle that we had to surpass in order to get closer to what our vision of the presentation looked like, and because documentation was so limited, we spent much time looking at each return value for procedures and object types that were in additional dependencies. One of our original goals was to make a *visually pleasing* slideshow presentation, and without this piece of code that could not have happened. 

```
(define (make-color slide) (colorize slide "White"))
```
