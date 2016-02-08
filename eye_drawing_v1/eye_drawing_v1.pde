import processing.video.*;
Movie myMovie;

void setup() {
  //size(600, 600);
  fullScreen();
  myMovie = new Movie(this, "crater.mp4");
  myMovie.play();
}

float previousX = 0;
float previousY = 0; 

void draw() {
  background(255);

  //fill(0);
  //strokeWeight(2);

  line(previousX, previousY, mouseX, mouseY);
  previousY = mouseY;
  previousX = mouseX; 
  //point(mouseX, mouseY);
  
    image(myMovie, 0, 0);

}

void movieEvent(Movie m) {
  m.read();
}