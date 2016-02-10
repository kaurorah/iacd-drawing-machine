import processing.video.*;
import org.jorgecardoso.processing.eyetribe.*;
import com.theeyetribe.client.data.*;

EyeTribe eyeTribe;

Movie myMovie;
//https://vimeo.com/154619333
ArrayList<Point> points = new ArrayList<Point>();
PVector point;
PImage image; 


void setup() {
  //size(600, 600);
  fullScreen();
  myMovie = new Movie(this, "crater.mp4");
  image = loadImage("frankenthaler.jpg");
  myMovie.play();
  //line = new PVector(0,0);
  eyeTribe = new EyeTribe(this);
  image(image, 0, 0, width, height);
}

float previousX = 0;
float previousY = 0; 

void draw() {
  println(frameRate); 
  //background(255);
  //image(myMovie, 0, 0, width, height);
  color c = get(mouseX, mouseY);


  //fill(0);
  //strokeWeight(2);
  Point newPoint = new Point (c, point.x, point.y);
  points.add(newPoint); 
  //line(previousX, previousY, mouseX, mouseY);
  //previousY = mouseY;
  //previousX = mouseX; 
  //point(mouseX, mouseY);

  if (keyPressed) {
    background(255);
    for (int i = 0; i < points.size(); i++) {

      Point thisPoint = points.get(i);
      if (i==0) {
        previousY = thisPoint.location.y;
        previousX = thisPoint.location.x;
      }
      strokeWeight(5);
      stroke(thisPoint.sampleRGB);
      line(previousX, previousY, thisPoint.location.x, thisPoint.location.y);
      previousY = thisPoint.location.y;
      previousX = thisPoint.location.x;
    }
  }
}

//void keyPressed() {
//background(255);
//  for (int i = 0; i < points.size(); i++) {

//    Point thisPoint = points.get(i);
//    if (i==0) {
//      previousY = thisPoint.location.y;
//      previousX = thisPoint.location.x;
//    }
//    strokeWeight(5);
//    stroke(thisPoint.sampleRGB);
//    line(previousX, previousY, thisPoint.location.x, thisPoint.location.y);
//    previousY = thisPoint.location.y;
//    previousX = thisPoint.location.x;
//  }
//}


void onGazeUpdate(PVector gaze, PVector leftEye_, PVector rightEye_, GazeData data) {
  if ( gaze != null ) {
    point = gaze.get();
  }
}

void movieEvent(Movie m) {
  m.read();
}