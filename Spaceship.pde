class Spaceship extends Floater  
{   
  Spaceship(){
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
    myCenterX = 250;
    myCenterY = 250; 
    myXspeed = 0; 
    myYspeed = 0; //holds the speed of travel in the x and y directions   
    myPointDirection = 0;
  }
public void hyperspace(){
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
  }
  public void stopMoving(){
    myXspeed = 0;
    myYspeed = 0;
  }//your code here

    //your code here
}

