class Spaceship extends Floater  
{   
  Spaceship(double a, double b){
    corners = 3;
    xCorners = new int[corners];   
    yCorners = new int[corners]; 
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    myColor = 255;   
    myCenterX = a;
    myCenterY = b; 
    myXspeed = 0; 
    myYspeed = 0; //holds the speed of travel in the x and y directions   
    myPointDirection = 0;
  }
  Spaceship(double a, double b, double c){
    corners = 3;
    xCorners = new int[corners];   
    yCorners = new int[corners]; 
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    myColor = 255;   
    myCenterX = a;
    myCenterY = b; 
    myXspeed = 0; 
    myYspeed = 0; //holds the speed of travel in the x and y directions   
    myPointDirection = c;
  }
public void hyperspace(){
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myPointDirection = (int)(Math.random()*361);
  }
  public void stopMoving(){
    myXspeed = 0;
    myYspeed = 0;
  }//your code here
  public double getMyX(){
    return myCenterX;
  }
  public double getMyY(){
    return myCenterY;
  }
  public double getPointDirection(){
    return myPointDirection;
  }
  public double getMyXSpeed(){
    return myXspeed;
  }
  public double getMyYSpeed(){
    return myYspeed;
  }
    //your code here
}
