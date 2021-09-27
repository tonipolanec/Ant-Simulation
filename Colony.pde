

class Colony {

  int size;
  PVector location;
  color col;
  Ant[] ants;

  Colony(int _size, color _color) {
    size = _size;
    do{
      location = new PVector(random(width), random(height));
    }while(!map.map[int(location.x)][int(location.y)]);
    
    col = _color;
    ants = new Ant[size];

    for (int i=0; i<ants.length; i++) {
      Ant tAnt = new Ant(this);
      ants[i] = tAnt;
    }
  }

  void display() {
    stroke(col);
    strokeWeight(35);
    point(location.x, location.y);

    for (int i=0; i<ants.length; i++) {
      ants[i].display();
    }
  }

  void update() {
    for (int i=0; i<ants.length; i++) {
      ants[i].move();
    }
  }
}
