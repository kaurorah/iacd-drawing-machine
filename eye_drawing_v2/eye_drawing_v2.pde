import processing.video.*;
import org.jorgecardoso.processing.eyetribe.*;
import com.theeyetribe.client.data.*;
import java.util.Collections;

EyeTribe eyeTribe;

Movie myMovie;
//https://vimeo.com/154619333
ArrayList<Point> points = new ArrayList<Point>();
PVector point;
PImage image; 


PVector calibratingPoint = null;
PVector leftEye, rightEye;


void setup() {
  //size(600, 600);
  fullScreen();
 // myMovie = new Movie(this, "crater3.mp4");
   image = loadImage("marilyn.jpg");
 // myMovie.play();
  eyeTribe = new EyeTribe(this);
  image(image, 0, 0, width, height);
}

float previousX = 0;
float previousY = 0; 

void draw() {
  println(frameRate); 

  if (key == CODED) {
    background(255);
   // myMovie.stop();
    for (int i = 0; i < points.size(); i++) {

      Point thisPoint = points.get(i);
      if (i==0) {
        previousY = thisPoint.location.y;
        previousX = thisPoint.location.x;
      }
      strokeWeight(100);
      stroke(thisPoint.sampleRGB, 100);
      line(previousX, previousY, thisPoint.location.x, thisPoint.location.y);
      previousY = thisPoint.location.y;
      previousX = thisPoint.location.x;
      
      //image(thisPoint.sampleImg, thisPoint.location.x, thisPoint.location.y); 

    }
  } else {
    //background(255);
    //image(myMovie, 0, 0, width, height);

    //println(point.x);
    //fill(0);
    if (point.x > 0) {
      color c = get((int)point.x, (int)point.y);
      //PImage sample = myMovie.get((int)point.x, (int)point.y, 100,100);
      Point newPoint = new Point (c, point.x, point.y);
      points.add(newPoint); 
    }
  }
}

void onGazeUpdate(PVector gaze, PVector leftEye_, PVector rightEye_, GazeData data) {
  if ( gaze != null ) {
    point = gaze.get();
  }
}
void trackerStateChanged(String state) {
  println("Tracker state: " + state);
}

void movieEvent(Movie m) {
  m.read();
}