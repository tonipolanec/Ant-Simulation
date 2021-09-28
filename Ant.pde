

class Ant {
  Colony colony;
  PVector loc, vel, acc, prevAcc;  
  boolean check;
  color colonyColor;

  List<PVector> dir;

  boolean searchingForFood, carryingFood;

  Ant(Colony _colony) {
    colony = _colony;
    loc = colony.location.copy();
    vel = new PVector(0, 0);
    acc = PVector.fromAngle(random(PI*2));//new PVector(0, 0);

    dir = new ArrayList<PVector>();

    searchingForFood = true;

    colonyColor = colony.col;
  }

  void move() {
    check = false;
    if (searchingForFood) {
      acc.rotate(random(PI/3)-PI/6);
    } else {
      acc = sensePheromone();
    }

    vel.add(acc);
    vel.limit(0.8);
    loc.add(vel);
    if (loc.x >= 0 && loc.x < width && loc.y >= 0 && loc.y < height)
      check = true;

    if (check) {
      if (food.foodMap[int(loc.x)][int(loc.y)] > 0) {
        searchingForFood = false;
        if(searchingForFood)
          food.foodMap[int(loc.x)][int(loc.y)]-=1;
      }
    }

    //  If they bump into a wall their velocity is reversed and bumped up so they escape the wall
    if (!check || !map.map[int(loc.x)][int(loc.y)]) {
      vel = vel.mult(-2.5);
      loc.add(vel);
    }

    releasingPheromone();
  }

  void display() {
    stroke(colonyColor);
    strokeWeight(3);
    point(loc.x, loc.y);
  }

  void releasingPheromone() {
    if (loc.x >= 0 && loc.x < width && loc.y >= 0 && loc.y < height) {
      if (searchingForFood) {
        colony.forHomePheromone.pMap[int(loc.x)][int(loc.y)] = 1;
      } else {
        colony.forFoodPheromone.pMap[int(loc.x)][int(loc.y)] = 1;
      }
    }
  }

  PVector sensePheromone() {
    PVector nomnom = new PVector();

    PVector s[] = new PVector[30];
    for (int i=0; i<30; i++) {
      s[i] = acc.copy().rotate(map(i, 0, 9, PI/4, -PI/4)).setMag(3);
    }

    for (int i=0; i<3; i++) {
      float prev = 0;
      if (check) {
        if (colony.forHomePheromone.pMap[int(loc.x+s[i].x)][int(loc.y+s[i].y)] > 0)
          if (colony.forHomePheromone.pMap[int(loc.x+s[i].x)][int(loc.y+s[i].y)] > prev) {
            nomnom = s[i];
            prev = colony.forHomePheromone.pMap[int(loc.x+s[i].x)][int(loc.y+s[i].y)];
          }
      }
    }
    nomnom = acc.rotate(random(PI/3)-PI/6);


    return nomnom;
  }

  void resetStats() {
  }
}


class Pheromone {

  int type;
  // 1 - follow for home  (255,165,0)
  // 2 - follow for food  (255,0,165)

  color c1 = color(255, 165, 0);
  color c2 = color(255, 0, 165);

  float pMap[][];

  Pheromone(int _type) {
    type = _type;
    pMap = new float[width][height];
  }


  void display() {
    for (int i=0; i<width; i+=4) {
      for (int j=0; j<height; j+=4) {
        if (pMap[i][j] > 0) {

          if (type == 1) {
            stroke(color(255, 165, 0, map(pMap[i][j], 0, 1, 0, 100)));
            strokeWeight(8);
            point(i, j);
          } else if (type == 2) {
            stroke(color(0, 165, 255, map(pMap[i][j], 0, 1, 0, 100)));
            strokeWeight(8);
            point(i, j);
          }

          pMap[i][j] -= 0.005; // Decay of pheromone
        }
      }
    }


    /*
    loadPixels();
     for (int i=0; i<width; i++) {
     for (int j=0; j<height; j++) {
     if (pMap[i][j] > 0) {
     if (type == 1)
     pixels[i+j*width] = color(255, 165, 0, map(pMap[i][j], 0, 1, 0, 100));
     //else if (type == 2)
     //pixels[i+j*width] = color(c2, map(pMap[i][j], 0, 1, 150, 0));
     
     pMap[i][j] -= 0.001; // Decay of pheromone
     }
     }
     }
     updatePixels();
     */
  }
}
