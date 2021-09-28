

class Colony {

  int size;
  PVector location;
  color col;
  Ant[] ants;
  Pheromone forHomePheromone, forFoodPheromone;

  Colony(int _size, color _color) {
    size = _size;
    do {
      location = new PVector(random(width), random(height));
    } while (!map.map[int(location.x)][int(location.y)]);

    col = _color;
    ants = new Ant[size];

    for (int i=0; i<ants.length; i++) {
      Ant tAnt = new Ant(this);
      ants[i] = tAnt;
    }

    forHomePheromone = new Pheromone(1);
    forFoodPheromone = new Pheromone(2);
  }

  void display() {
    
    forHomePheromone.display();
    forFoodPheromone.display();

    for (int i=0; i<ants.length; i++) {
      ants[i].display();
    }



    stroke(col);
    strokeWeight(35);
    point(location.x, location.y);
  }

  void update() {
    for (int i=0; i<ants.length; i++) {
      ants[i].move();
    }
  }
}
