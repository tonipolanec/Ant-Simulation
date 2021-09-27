

class Map {

  float increment = 0.006;
  float noiseMap[][];
  boolean map[][];

  Map() {
    //noiseMap = new float[width][height];
    map = new boolean[width][height];
    drawMap();
  }

  void drawMap() {
    loadPixels();
    float xoff = 0.0;

    for (int i = 0; i < width; i+=1) {
      xoff += increment;   
      float yoff = 0.0;   
      for (int j = 0; j < height; j+=1) {
        yoff += increment; 

        float rand = noise(xoff, yoff);
        //println(rand);
        if(rand > 0.41){
          map[i][j] = true;
          pixels[i+j*width] = color(200);
        }else{
          map[i][j] = false;
          pixels[i+j*width] = color(0);
        }

      }
    }
    updatePixels();
  }



  void display() {
    loadPixels();   
    
    for (int i=0; i<width; i++) {
      for (int j=0; j<height; j++) {
        if(map[i][j])
          pixels[i+j*width] = color(200);
        else 
          pixels[i+j*width] = color(0);            
      }
    }
    updatePixels();
  }
}
