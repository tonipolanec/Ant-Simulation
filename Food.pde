

class Food{

  float foodMap[][];
  int foodSize=10;
  
  Food(){
    foodMap = new float[width][height];
  }
  
  void drawFood(){
  
    for(int i=mouseX-foodSize; i< mouseX+foodSize; i++){
      for(int j= mouseY-foodSize; j<mouseY + foodSize; j++){
        foodMap[i][j] = 1;
      }
    }
  }
  
  void display(){   
    //stroke(0,255,0);
    //strokeWeight(3);
    
    loadPixels();
    for(int i=0;i<width;i++){
      for(int j=0;j<height;j++){
        if(foodMap[i][j] > 0)
          pixels[i+j*width] = color(0,255,0);
        //  point(i,j);
      }
    }
    updatePixels();
  
  }
  











}
