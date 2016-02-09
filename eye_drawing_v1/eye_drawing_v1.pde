import processing.video.*;
Movie myMovie;
//https://vimeo.com/154619333
ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  //size(600, 600);
  fullScreen();
  myMovie = new Movie(this, "crater.mp4");
  //myMovie.play();
  //line = new PVector(0,0);
}

float previousX = 0;
float previousY = 0; 

void draw() {
  //background(255);
  //image(myMovie, 0, 0, width, height);

  //fill(0);
  //strokeWeight(2);
  points.add(new PVector(mouseX, mouseY));
  //line(previousX, previousY, mouseX, mouseY);
  //previousY = mouseY;
  //previousX = mouseX; 
  //point(mouseX, mouseY);

  if (key == CODED) {
    if (keyCode == UP) {
      for (int i = 0; i < points.size(); i++) {

        PVector point = points.get(i);
        if (i==0) {
          previousY = point.y;
          previousX = point.x;
        }
        line(previousX, previousY, point.x, point.y);
        previousY = point.y;
        previousX = point.x;
      }
    }
    if (keyCode == DOWN) {
      background(255); 
      }
    }
  }




void movieEvent(Movie m) {
  m.read();
}