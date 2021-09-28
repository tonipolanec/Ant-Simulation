import java.util.List;

Map map;
Colony col1;
color wallColor = color(151);
Food food;

void setup() {
  size(1280, 720);
  map = new Map();

  col1 = new Colony(500, color(0, 0, 255));
  food = new Food();
}

void draw() {
  background(0);
  
  map.display();  
  food.display();
  
  col1.update();
  col1.display();

  //<>//
}

void mouseDragged(){
  food.drawFood();
}
