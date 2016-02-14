class Point {
  color sampleRGB; 
  PVector location;   
  PImage sampleImg;

  Point(color c, float _x, float _y, PImage _s) {
    sampleRGB = c;
    location = new PVector (_x, _y); 
    sampleImg = _s;
  }


  Point(color c, float _x, float _y) {
    sampleRGB = c;
    location = new PVector (_x, _y);
  }
}