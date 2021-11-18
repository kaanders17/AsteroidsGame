class Particle{
  float myX, myY, mySize;
  double myAngle, mySpeed;
  int myColor;
  Particle(){
    myX = 320;
    myY = 240;
    myAngle = Math.random() *2*Math.PI;
    mySpeed = Math.random() * 7 + 2;
    myColor = (255); 
    mySize = (float)(Math.random() + 1);
}
  void show(){
    noStroke();
    fill(myColor);
    float size = (float)mySize * dist(320, 240, myX, myY)/60;
    //ellipse((float)myX, (float)myY, size, size);
    rect((float)myX, (float)myY, size, size);
  }
  void moves(){
    myX = myX + (float)(Math.cos(myAngle) * mySpeed);
    myY = myY + (float)(Math.sin(myAngle) * mySpeed);
  }
  void reset(){
    if(myX > 640 || myY > 640 || myX < 0 || myY < 0){
      myX = 320;
      myY = 240;
      myAngle = Math.random() * 360;
      mySpeed = Math.random() * 7 + 2;
    }
  }
}
