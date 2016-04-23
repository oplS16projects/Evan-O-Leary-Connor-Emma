# Domain Specific Language for Slideshow in Racket

### Statement
* Everyone is familiar with creating slideshow presentations in What You See Is What You Get (WYSIWYG) interfaces, such as Google Slides
* Using Racket we can construct a presentation slides by implementing the slideshow library along with other helper libraries as needed
* How can we create an informative and visually pleasing presentation using Racket?
* How can we improve the existing slideshow library using our own implementations of high-level procedures to ease the process of creating slides? 
* Can we make these improvments using a domain specific language?

### Analysis
  * We will be applying the concepts learned until this point in class; recursion, hierarchical structures, higher-order procedures, and abstractions are some of the approaches that will be used to complete the project
  * We will be creating information (data) and will be using this as the content of the presentation
  * We will make use of the Slideshow, Pict, and potentially RSound and GUI libraries
  * We will be building on top of the Pict library by creating procedures to create and process rich media using our own domain specific language

### Data set or other source materials
The data that our project requires is both textual and visual. Background research into our presentation's topic (a brief history of space exploration) will provide text and pictures to make our presentation visually pleasing. Although other images may be used and text corroborated by analyzing other sites our starting point is the Wikipedia page [Space Exploration](https://en.wikipedia.org/wiki/Space_exploration).

### Deliverable and Demonstration
  * The end goal is a fully functional, informative, and graphically well designed slideshow presentation
  * A minimum of 10 slides
  * To illustrate the capabilities of Racket slideshow library
  * The inclusion of sound and video as a personal stretch goal

### Evaluation of Results
* Presentation will include a minimum of 10 slides
* Presentation will be visually appealing, informative, and have a consistent theme
* Presentation will include pictures 
* Presentation will potentially include video and sound (depending on library capabilities)
* Presentation will inform on the history of space exploration

## Architecture Diagram
![alt-text](https://i.imgur.com/J9Pmyqu.jpg)

We will begin by gathering information which will be our **Slideshow content** on the subject of our powerpoint, and creating a **Sister Powerpoint** as a dummy final product modeling for our Racket-driven powerpoint. The **local resources** will be gathered during the construction of our sister powerpoint. The paths to each individual resource will be handed directly to functions inside the **Slideshow API** which utilizes **Pict** behind the scenes to display the actual image to the screen, and then its own set of methods to add the image to a powerpoint. 

## Schedule

### Updated First Milestone
# Goals from the original milestone plan have been revised
* Project pivot took place as of the week starting Monday, April 4
- New focus of the project concentrates of the concept of domain specific language, and using abstractions based on existing libraries
* Rudimentary sample slides created in powerpoint as a model, and in Racket as a first attempt at slimming down the procedures. 
* Attempt made at implementation of DSL through constructor and predicate?

### First Milestone (Fri Apr 15)
* Outline of slides will be completed (w/placeholder info)
*	Titles for slides will be drafted, thus the total number of slides will be decided
*	Colors and styles will be decided roughly, can be changed later as needed
*	Draft slideshow will be made in PowerPoint, to be used as plan for Racket implementation
*	Screenshots of current slides

# Goals from the Second Milestone have mostly been met

### Second Milestone (Fri Apr 22)
* Screenshots of current slides (Completed)
*	Pictures, sound and video will be added (Completed)
*	Most placeholder text should be replaced at this point (Completed)
* Styles applied to text (Completed)
* Slideshow will be looped (Completed)

### Final Presentation (last week of semester)
* Implement final touches (make sure design scheme is agreed upon and adjust if needed)
* Prepare for presentation logistics (who's laptop to use, developing any speech/instructions needed to introduce project, ect.)

## Group Responsibilities

### Evan O'Leary @olearyevan
* Will research and draft text to be used in the presentation
* Will select and obtain the images to be used in the presentation
* Will draft a Powerpoint presentation as a guide to be implemented using Racket
* Will create and order slides in Racket 

### Connor Emma @connoremma
  * Will layout and implememt the outline of slides
  * Will look into the Pict library to research including images in the slideshow
  * Will apply styles to text in slideshow
  * Will implement the infographics as the content permits 
