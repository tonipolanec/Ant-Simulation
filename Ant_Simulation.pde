import java.util.List;

Map map;
Colony col1;
color wallColor = color(151);

void setup() {
  size(1280, 720);
  map = new Map();

  col1 = new Colony(500, color(0, 0, 255));
}

void draw() {
  background(0);
  
  map.display();
  
  col1.update();
  col1.display();
  //<>//
}
