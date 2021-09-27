

class Ant {
  Colony colony;
  PVector loc, vel, acc, prevAcc;

  color colonyColor;

  List<PVector> dir;

  boolean carryingFood;

  Ant(Colony _colony) {
    colony = _colony;
    loc = colony.location.copy();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    dir = new ArrayList<PVector>();
    
    carryingFood = false;

    colonyColor = colony.col;
  }

  void move() {

    acc = PVector.fromAngle(random(2*PI));
    vel.add(acc);
    vel.limit(2.5);

    loc.add(vel);

    //  If they bump into a wall their velocity is reversed and bumped up so they escape the wall
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height
      || !map.map[int(loc.x)][int(loc.y)]) 
      vel = vel.mult(-5);
    
  }

  void display() {
    stroke(colonyColor);
    strokeWeight(3);
    point(loc.x, loc.y);
  }

  void restartStats() {
  }
}
