class Point {
  color sampleRGB; 
  PVector location;   
  
  Point(color c, float _x, float _y) {
    sampleRGB = c;
    location = new PVector (_x, _y); 
  }
  
}