void setup() {
  background(255);
  size(300, 300);
}

float previousX = 0;
float previousY = 0; 

void draw() {
  fill(0);
  strokeWeight(2);

  line(previousX, previousY, mouseX, mouseY);
  previousY = mouseY;
  previousX = mouseX; 
  //point(mouseX, mouseY);
}