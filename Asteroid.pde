class Asteroid extends Floater{
  private int rotationSpeed;
  Asteroid(){
    corners = 8;
    xCorners = new int[corners];   
    yCorners = new int[corners]; 
    xCorners[0] = (int)(Math.random()*3) - 12;
    yCorners[0] = (int)(Math.random()*3) - 9;
    xCorners[1] = (int)(Math.random()*3) - 1;
    yCorners[1] = (int)(Math.random()*3) - 12;
    xCorners[2] = (int)(Math.random()*3) + 6;
    yCorners[2] = (int)(Math.random()*3) - 9;
    xCorners[3] = (int)(Math.random()*3) + 12;
    yCorners[3] = (int)(Math.random()*3) - 1;
    xCorners[4] = (int)(Math.random()*3) + 5;
    yCorners[4] = (int)(Math.random()*3) + 9;
    xCorners[5] = (int)(Math.random()*3) - 1;
    yCorners[5] = (int)(Math.random()*3) + 10;
    xCorners[6] = (int)(Math.random()*3) - 12;
    yCorners[6] = (int)(Math.random()*3) + 5;
    xCorners[7] = (int)(Math.random()*3) - 12;
    yCorners[7] = (int)(Math.random()*3) - 1;
    
    
    //xCorners[0] = (int)(Math.random()*5) - 13;
    //yCorners[0] = (int)(Math.random()*5) - 10;
    //xCorners[1] = (int)(Math.random()*5) - 2;
    //yCorners[1] = (int)(Math.random()*5) - 13;
    //xCorners[2] = (int)(Math.random()*5) + 5;
    //yCorners[2] = (int)(Math.random()*5) - 10;
    //xCorners[3] = (int)(Math.random()*5) + 11;
    //yCorners[3] = (int)(Math.random()*5) - 2;
    //xCorners[4] = (int)(Math.random()*5) + 4;
    //yCorners[4] = (int)(Math.random()*5) + 8;
    //xCorners[5] = (int)(Math.random()*5) - 2;
    //yCorners[5] = (int)(Math.random()*5) + 9;
    //xCorners[6] = (int)(Math.random()*5) - 13;
    //yCorners[6] = (int)(Math.random()*5) + 6;
    //xCorners[7] = (int)(Math.random()*5) - 13;
    //yCorners[7] = (int)(Math.random()*5) - 2;
    
    myColor = 255;   
    myCenterX = (int)(Math.random()*480) + 10;
    myCenterY = (int)(Math.random()*480) + 10; 
    myXspeed = (Math.random()*2); 
    myYspeed = (Math.random()*2); //holds the speed of travel in the x and y directions   
    myPointDirection = (int)(Math.random() * 360);
    rotationSpeed = (int)(Math.random()*20) - 10;
  }
  public void move ()   //move the floater in the current direction of travel
  { 
    turn(rotationSpeed);
    super.move();
  }
  public double getMyCenterX(){
    return myCenterX;
  }
  public double getMyCenterY(){
    return myCenterY;
  }
  public void show ()  //Draws the floater at the current position  
  {
    fill(0);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
